from golang:1.22 as base

workdir  /app

copy  go.mod .

run go mod download
copy . .
# copy all the project contents from local
run go  build -o main .

# final stage --distroless image
# this is for reduce the size of docker file and secure the docker file by creting multistage docker file
from gcr.io/distroless/base

copy --from=base /app/main .
# copy into default directory from /app/main  to . (. is default directory )
copy --from=base  /app/static ./static

expose 8080

cmd [ "./main" ]
