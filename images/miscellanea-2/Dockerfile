# https://docs.docker.com/build/building/multi-stage/

FROM ubuntu:latest AS base
RUN echo "base"

FROM base AS stage1
RUN echo "stage1"

FROM base AS stage2
RUN echo "stage2"

# docker image build --target base .
# docker image build --target stage1 .
# docker image build --target stage2 .
