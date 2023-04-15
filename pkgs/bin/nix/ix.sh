{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/nix/archive/refs/tags/2.15.0.tar.gz
sha:5812d3153edf1919bd53813536301973130fab5e2981de640056d7147de8cd5d
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
lib/googletest
lib/rapidcheck
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
