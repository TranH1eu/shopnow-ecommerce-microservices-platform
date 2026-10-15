FROM alpine:3.18

# Cài đặt curl, jq, bash và kubectl client
RUN apk add --no-cache bash curl jq && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

WORKDIR /app

COPY build-script.sh .
RUN chmod +x build-script.sh

CMD ["/bin/bash", "build-script.sh"]
