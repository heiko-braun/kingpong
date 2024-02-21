A simple utililty for testing k8s deployments 


In essence, it allows you to start either a ping service, or a pong one.

```
./pingpong 
  -asPing
    	Starts Ping service
  -asPong
    	Starts Pong service
  -pongHost string
    	Host (valid DNS name or IP) of the pong service (default "http://localhost")
  -pongPort int
    	Port of the pong service (default 8081)
  -port int
    	Sets the port (default 8080)
```

Packaged as containers, you can launch two pods, `ping` invoking on `pong` and returning the repsonse.