FROM azul/zulu-openjdk-alpine:17-jre-headless
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV JAVA_HOME=/usr/lib/jvm/zulu17-ca
ENV JAVA_OPTS="-Xmx2G"

WORKDIR /app
VOLUME /app/data /app/log
RUN addgroup --system javauser && \
      adduser -S -s /bin/false -G javauser javauser && \
      chown -R javauser:javauser /app

COPY build/libs/demo-*-all.jar ./demo.jar

USER javauser
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar", "$JAVA_OPTS"]
