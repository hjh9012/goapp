 FROM golang:1.15-alpine3.12 AS build
 MAINTAINER hjh <hjh@2cl.co.kr>
 LABEL "purpose"="Service Deployment using Multi-stage builds."
 WORKDIR /src/
 COPY goapp.go go.* /src
 RUN CGO_ENABLED=0 go build -o /bin/demo
 
 FROM scratch
 COPY --from=build /bin/demo /bin/demo
 ENTRYPOINT ["/bin/demo"]
