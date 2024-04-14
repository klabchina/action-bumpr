FROM alpine:3.14

# ENV BUMP_VERSION=v1.1.0
ENV OWNER=klabchina
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk --no-cache add git git-lfs jq grep curl
RUN wget -O - -q https://raw.githubusercontent.com/klabchina/bump/master/install.sh| sh -s -- -b /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh

# set the runtime user to a non-root user and the same user as used by the github runners for actions runs.
# USER 1001

ENTRYPOINT ["/entrypoint.sh"]
