{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/nix/archive/refs/tags/2.17.0.tar.gz
sha:12437617f0e0eda5594cb594cab06ecb84e007ae336717c89d16fa5acf8048a3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curl
lib/cpuid
lib/boost
lib/kernel
lib/brotli
lib/sodium
lib/bzip/2
lib/lowdown
lib/seccomp
lib/openssl
lib/archive
lib/editline
lib/sqlite/3
lib/rapidcheck
lib/google/test
lib/boehmgc/c++
lib/bsd/overlay
lib/json/nlohmann/11
{% endblock %}

{% block bld_tool %}
bin/jq
bld/bash
bld/flex
bld/bison
bin/lowdown
bld/auto/archive
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure_flags %}
--disable-doc-gen
{% endblock %}
