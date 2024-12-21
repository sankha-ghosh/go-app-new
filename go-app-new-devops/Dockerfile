<<<<<<< HEAD
# Containerize the go application that we have created
# This is the Dockerfile that we will use to build the image
# and run the container

# Start with a base image
FROM golang:1.21 as base

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files to the working directory
COPY go.mod ./

# Download all the dependencies
RUN go mod download

# Copy the source code to the working directory
COPY . .

# Build the application
RUN go build -o main .

#######################################################
# Reduce the image size using multi-stage builds
# We will use a distroless image to run the application
FROM gcr.io/distroless/base

# Copy the binary from the previous stage
COPY --from=base /app/main .

# Copy the static files from the previous stage
COPY --from=base /app/static ./static

# Expose the port on which the application will run
EXPOSE 8080

# Command to run the application
CMD ["./main"]
=======
from golang:1.23 as base

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
>>>>>>> origin/main
