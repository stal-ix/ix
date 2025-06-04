{% extends '//lib/compiler_rt/builtins/hack/ish/ix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
bld/boot/1/lib/musl
{% endblock %}

{% block bld_deps %}
bld/boot/1/sh
bld/boot/0/env
{% endblock %}

{% block patch %}
{{super()}}
rm lib/builtins/int_util.c
{% endblock %}

{% block setup_compiler %}
source_env "${IX_T_DIR}"
setup_tc_here
{% endblock %}

{% block env %}
export LDFLAGS="-L${out}/lib -lcompiler_rt \${LDFLAGS}"
{% endblock %}
