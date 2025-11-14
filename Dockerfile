# 第一阶段：构建阶段（用 Maven 打包 jar 包，避免本地提前打包）
FROM maven:3.8.8-openjdk-17 AS builder
# 设置工作目录（容器内的目录，随便命名，如 /build）
WORKDIR /build
# 复制项目的 pom.xml 到容器（先复制 pom 是为了缓存依赖，后续修改代码无需重新下载依赖）
COPY pom.xml .
# 下载项目所有依赖（如果 pom 没改，这一步会缓存）
RUN mvn dependency:go-offline
# 复制项目所有源代码到容器
COPY src ./src
# 打包 Spring Boot 项目（-DskipTests 跳过测试，加快打包速度）
RUN mvn clean package -DskipTests

# 第二阶段：运行阶段（用精简的 JDK 镜像，减小最终镜像体积）
FROM openjdk:17-jdk-slim
# 作者信息（可选，可删除）
LABEL author="tingfeng"
# 设置工作目录（容器内的目录，如 /app）
WORKDIR /app
# 从构建阶段复制打包好的 jar 包到当前镜像（注意：jar 包名称要和你本地打包后的一致！）
# 重点：替换 `LibraryManager-0.0.1-SNAPSHOT.jar` 为你实际的 jar 包名称！
COPY --from=builder /build/target/LibraryManager-0.0.1-SNAPSHOT.jar /app/app.jar
# 暴露项目端口（必须和你 Spring Boot 配置文件中的 server.port 一致，默认 8080）
EXPOSE 8080
# 容器启动时执行的命令（启动 jar 包）
ENTRYPOINT ["java", "-jar", "/app/app.jar"]