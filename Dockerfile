FROM zetaron/docker-deployment-worker:1.0.0
MAINTAINER Fabian Stegemann

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="hook-deployment-worker" \
      org.label-schema.description="Tries to run the `hooks/pre_deploy`, `hooks/deploy` and `hooks/post_deploy` scripts inside the `/var/cache/deployment` directory." \
      org.label-schema.url="https://github.com/zetaron/hook-deployment-worker" \
      org.label-schema.vcs-url="https://github.com/zetaron/hook-deployment-worker" \
      org.label-schema.version="1.0.0" \
      org.label-schema.docker.cmd="docker run -d -v $SECRET_VOLUME_NAME:/var/cache/secrets:ro -v $DEPLOYMENT_CACHE_VOLUME_NAME:/var/cache/deployment zetaron/hook-deployment-worker:1.0.0"

COPY . /usr/bin

ENTRYPOINT ["/usr/bin/secret-wrapper", "deploy"]
