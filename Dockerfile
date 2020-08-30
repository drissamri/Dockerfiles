FROM adoptopenjdk/openjdk11
LABEL maintainer "Driss Amri <driss.amri@telenetgroup.be>"

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ENV AWSCLI_VERSION 2.0.44 

RUN apt-get update && \
    apt-get install -y \
      curl \
      jq \
      python3-pip \
      unzip \
      bash && \
    curl -sL https://deb.nodesource.com/setup_14.x  | bash - && \
    apt-get -y install nodejs && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && \
    rm -rf \
        awscliv2.zip \
        aws \
        /usr/local/aws-cli/v2/*/dist/aws_completer \
        /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
        /usr/local/aws-cli/v2/*/dist/awscli/examples \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean 
