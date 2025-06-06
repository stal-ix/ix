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
