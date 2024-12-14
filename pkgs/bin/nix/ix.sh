{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/nix/archive/refs/tags/2.25.2.tar.gz
sha:854fefe06d632188eef312b971395013c94676824e860bf4f5b60a41205b802a
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curl
lib/git/2
lib/cpuid
lib/boost
lib/kernel
lib/brotli
lib/sodium
lib/bzip/2
lib/toml/11
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
lib/json/nlohmann
{% endblock %}

{% block bld_tool %}
bin/jq
bld/bash
bld/flex
bld/bison
bin/lowdown
bld/auto/archive
{% endblock %}

{% block make_tool %}
bin/make/proper
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure_flags %}
--disable-doc-gen
--disable-unit-tests
--disable-functional-tests
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|-Werror=suggest-override||g' \
        -e 's|-Werror=switch-enum||g' \
        -i ${l}
done
{% endblock %}

{% block cpp_defines %}
SYS_close_range=436
{% endblock %}

{% block setup_target_flags %}
# https://github.com/NixOS/nix/pull/9997/commits/64cbd4c05a413eae55cde784594472f921fc7367
export OPTFLAGS="${OPTFLAGS} -UNDEBUG"
{% endblock %}
