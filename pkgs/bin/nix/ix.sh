{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/nix/archive/refs/tags/2.11.1.tar.gz
sha:69cb34a36518e38f80ab0a1bfe8fd3661c35dd86673652880130b5497c0c6eea
{% endblock %}

{% block bld_libs %}
lib/c
lib/curl
lib/cpuid
lib/boost
lib/linux
lib/brotli
lib/sodium
lib/bzip/2
lib/boehmgc
lib/lowdown
lib/seccomp
lib/openssl
lib/archive
lib/editline
lib/sqlite/3
lib/googletest
lib/json/nlohmann
{% endblock %}

{% block bld_tool %}
bin/jq
bld/bash
bld/flex
bld/bison
bin/auto/conf/archive
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}
