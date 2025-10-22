## Quick context for code-writing agents

- This repository is a multi-module Java (Spring Boot) monorepo for the OOMALL teaching project. Top-level modules are declared in the root `pom.xml` and include `core`, `shop`, `product`, `prodorder`, `gateway`, `region`, and `freight`.
- `core` (groupId `cn.edu.xmu.javaee`, artifactId `core`) provides shared libraries, JPA/Mongo/Redis helpers, and common configuration. Most modules import `core` at build/runtime.

## Big-picture architecture

- Each service is a Spring Boot application (see `*Application.java` in module `src/main/java`). Example boot classes:
  - `core/src/main/java/cn/edu/xmu/javaee/core/CoreApplication.java`
  - `product/src/main/java/cn/edu/xmu/oomall/product/ProductApplication.java` (uses `@EnableJpaRepositories`, `@EnableMongoRepositories`, `@EnableFeignClients`)
  - `gateway/src/main/java/cn/edu/xmu/oomall/gateway/GatewayApplication.java` (discovery + refresh scope)
- Typical cross-service patterns: Feign clients for sync calls, Nacos for config/discovery, Redis (with Bloom filter), Mongo for document data, MySQL via JPA/MyBatis, Elasticsearch for search, RocketMQ for messaging.
- Packages: modules scan `cn.edu.xmu.javaee.core` and the module package (e.g. `cn.edu.xmu.oomall.product`) via `scanBasePackages` — preserve this when refactoring.

## Developer workflows (concise + specific)

- Build ordering: `core` must be installed to the local maven repo before other modules can build. Typical sequence:
  1. In root `pom.xml` temporarily comment out non-core `<module>` entries (or `cd core`)
  2. Run `mvn clean install` at repo root or `mvn -pl core clean install` to install `core` artifact
  3. Restore root `pom.xml` (if edited) and build other modules normally (`mvn clean package` or per-module `mvn clean pre-integration-test -Dmaven.test.skip=true`)
- Tests: the repository runs scheduled unit and integration tests (see `README.md`), but for local verification run `mvn -DskipTests=false test` per module or from root (may require `core` installed).

## Conventions and patterns agents should follow

- Do not change `scanBasePackages` values in `*Application.java` without updating dependent modules; many modules rely on `cn.edu.xmu.javaee.core` beans and JPA config.
- When adding repositories, follow existing pattern in `ProductApplication.java`: JPA repository base packages live under `*module*/mapper/jpa` and Mongo repositories under `*module*/mapper/mongo`.
- Shared utilities/types live in `core` — prefer adding helpers there if multiple modules will use them.
- Maven versions and dependency management are centralized in the root `pom.xml`. Add dependencies there only when they must be available across modules.

## Config & environment notes

- Configuration files used in deployment live in `conf/` (mysql, redis, mongo, nginx, es, rocketmq). During docker deployments these directories are mounted into containers (see `README.md`).
- Modules use `application.yaml`/`application.yml` per microservice. Nacos is used for centralized config; DataId format: `${spring.application.name}.yaml` (see README).
- Port configuration is set per module `application.yaml` (verify before running multiple modules locally).

## Common edit examples (copy-paste safe)

- If you add a new Spring component that must be visible to services, ensure package is under `cn.edu.xmu.javaee.core` or the module package scanned by that service.
- To run a single module locally (example: product):
  - Ensure `core` is installed: `mvn -pl core clean install`
  - From `product` module: `mvn spring-boot:run` or `mvn clean package && java -jar target/*.jar`

## Files to reference when modifying project structure

- Root project: `pom.xml` (module list, dependencyManagement, repositories)
- Shared code: `core/pom.xml` and `core/src/main/java/cn/edu/xmu/javaee/core`
- Example module entrypoints: `product/ProductApplication.java`, `gateway/GatewayApplication.java`, `shop/ShopApplication.java`
- Deployment/config: `conf/` and `README.md` (docker swarm and run instructions)

If any section lacks detail or you'd like troubleshooting scripts (IDE launch configs, recommended run profiles, or test harnesses), tell me which area to expand and I'll update this file.
