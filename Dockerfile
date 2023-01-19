#Runner
FROM openjdk:17-alpine
ADD build/libs/order-ecommerce-java-*.jar /app.jar
#COPY setup.sql /docker-entrypoint-initdb.d/

ENTRYPOINT java \
              $JAVA_OPTS \
              -Dspring.datasource.orderecommercedb.url=jdbc:postgresql://localhost:5432/orderecommerce_db?currentSchema=public \
              -Dspring.datasource.orderecommercedb.name=orderecommerceuser \
              -Dspring.datasource.orderecommercedb.password=orderecommercepwd \
              -Dspring.datasource.orderecommercedb.hikari.connectiontimeout=60000 \
              -Dspring.datasource.orderecommercedb.hikari.maximumpoolsize=5 \
              -Dspring.datasource.orderecommercedb.hikari.poolname=orderecommercedb \
              -Dspring.datasource.orderecommercedb.hikari.autocommit=false \
              -Dservice.name=orderecommerce \
              -Dspring_application_context_path=/order-ecommerce \
             -jar \
             app.jar

EXPOSE 8080
