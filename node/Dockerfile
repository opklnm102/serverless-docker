ARG BASE_IMAGE=node:latest

FROM $BASE_IMAGE

# SERVERLESS_VERSION is set explicitly in the Makefile used to build, otherwise use latest version
ARG SERVERLESS_VERSION=latest
ENV SERVERLESS_VERSION $SERVERLESS_VERSION

RUN npm install -g serverless@$SERVERLESS_VERSION

WORKDIR /opt/app
