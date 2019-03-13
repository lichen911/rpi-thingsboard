FROM arm32v7/openjdk:8-jre

ARG TB_VERSION=2.3

COPY thingsboard-${TB_VERSION}.deb start_tb.sh /
RUN dpkg -i thingsboard-${TB_VERSION}.deb \
    && update-rc.d thingsboard disable

ENV HTTP_BIND_PORT=9090
ENV DATABASE_TS_TYPE=sql
ENV DATABASE_ENTITIES_TYPE=sql
ENV JAVA_OPTS="-Xms256M -Xmx256M"

ENV SPRING_JPA_DATABASE_PLATFORM=org.hibernate.dialect.PostgreSQLDialect
ENV SPRING_DRIVER_CLASS_NAME=org.postgresql.Driver
ENV SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/thingsboard
ENV SPRING_DATASOURCE_USERNAME=thingsboard
ENV SPRING_DATASOURCE_PASSWORD=thingsboard

EXPOSE 9090 1883 9001

CMD ["/start_tb.sh"]
