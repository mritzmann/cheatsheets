# Buildpacks

Cloud Native Buildpacks.

- Necessary tools: https://buildpacks.io/
- Production-ready buildpacks: https://paketo.io/

## Lifecycle

Will be executed by `pack build` in this order:

- **Analyze:** Collects metadata from previously builds
- **Detect:** Determines which buildpacks are required
- **Restore:** Copies previously-cached build-time dependencies into build container
- **Build:** Excecutes each buildpack's build binary, download dependencies, compiles app, sets start command
- **Export:** Creates final oci image

## Pack Cheat Sheet

- **Builder:** An image that contains the os layer and a set ot buildpacks
- **Buildpack:** A set of executables that inspects your app source code and creates a plan to build and run your application

List recommended builders:

```shell
pack builder suggest
```

Build:

```shell
pack build <image-name> --builder <builder-to-use>
pack build testbuild --builder paketobuildpacks/builder:base
```

## Pack Example

```shell
$ ls -li
app.js

$ cat app.js 
var http = require('http');
http.createServer(function (request, response) {
   response.writeHead(200, {'Content-Type': 'text/plain'});
   response.end('Hello world from nodejs!');
}).listen(8080);

$ pack build testbuild --builder paketobuildpacks/builder:base
(..)
Successfully built image testbuild

$ docker run --rm -p 8080:8080 testbuild

$ curl http://127.0.0.1:8080
Hello world from nodejs!%
```
