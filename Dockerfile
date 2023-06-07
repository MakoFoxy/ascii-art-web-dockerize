FROM golang:alpine AS builder
RUN mkdir /app
WORKDIR /app
COPY . .
RUN go build -v -o main main.go
FROM alpine
LABEL name="ASCII-ART-WEB-DOCKERIZE"
LABEL git-repo="git@git.01.alem.school:smustafi/ascii-art-web-dockerize.git"
LABEL authors="smustafi, vtarasso"
LABEL release-date="15/02/2023"
WORKDIR /app
COPY --from=builder /app .
EXPOSE 4000
CMD ["./main"]