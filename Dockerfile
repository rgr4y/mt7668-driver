# Native aarch64 build env for the mt7668 module.
# The prebuilt kernel-header scripts (fixdep/modpost) under usr/src are
# aarch64 ELF binaries, so this must run as linux/arm64 (qemu binfmt on an
# x86 host) — cross-compiling from x86 can't execute them.
FROM ubuntu:26.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        bc \
        kmod \
        libssl-dev \
        libelf-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /src
