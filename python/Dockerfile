ARG BASE_IMAGE=nikolaik/python-nodejs:latest

FROM $BASE_IMAGE

# SERVERLESS_VERSION is set explicitly in the Makefile used to build, otherwise use latest version
ARG SERVERLESS_VERSION=latest
ENV SERVERLESS_VERSION $SERVERLESS_VERSION

RUN npm install -g npm && \
    npm install -g serverless@$SERVERLESS_VERSION

WORKDIR /opt/app
