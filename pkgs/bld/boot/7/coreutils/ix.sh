{% extends '//bld/boot/4/coreutils/ix.sh' %}

{% block bld_libs %}
bld/boot/4/lib/compiler_rt
{% endblock %}

{% block bld_deps %}
bld/boot/6/env/std
bld/boot/4/patch
bld/boot/4/byacc
{% endblock %}
