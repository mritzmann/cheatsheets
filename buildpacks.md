# Cloud Native Buildpacks

- Necessary tools: https://buildpacks.io/
- Production-ready buildpacks: https://paketo.io/

## Lifecycle

Will be executed by `pack build` in this order:

- **Analyze:** Collects metadata from previously builds
- **Detect:** Determines which buildpacks are required
- **Restore:** Copies previously-cached build-time dependencies into build container
- **Build:** Excecutes each buildpack's build binary, download dependencies, compiles app, sets start command
- **Export:** Creates final oci image
