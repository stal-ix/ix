{% extends '//bin/coreutils/8/31/ix.sh' %}

{% block bld_libs %}
bld/boot/4/lib/compiler_rt
{% endblock %}

{% block bld_deps %}
bld/boot/4/patch
bld/boot/4/byacc
bld/boot/4/mawk
bld/boot/3/env
{% endblock %}

{% block cpp_includes %}
${PWD}/lib
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
export PATH="${PWD}/src:${PATH}"
{% endblock %}
