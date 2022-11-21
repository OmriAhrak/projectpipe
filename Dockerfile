FROM maven:3.6.3-openjdk-14-slim AS build
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN mvn package --file pom.xml

FROM openjdk:14-slim
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]lz