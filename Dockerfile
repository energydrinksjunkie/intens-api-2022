FROM openjdk:8

WORKDIR /intens-praksa

ENV PORT=8080

COPY pom.xml .

COPY .mvn/ .
COPY ./.mvn ./.mvn

RUN ./mwnw dependency:go-offline

COPY src ./src

RUN ./mvnw package -DskipTests

CMD ["java", "-jar", "target/praksa2022-0.0.1-SNAPSHOT.jar"]

EXPOSE $PORT