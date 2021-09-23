from ghcr.io/foundeo/cfml-ci-tools/cfml-ci-tools:1.0.4

COPY entrypoint.sh /app

RUN chmod +x /app/entrypoint.sh
ENTRYPOINT [ "/app/entrypoint.sh" ]