{% extends '//bld/boot/5/coreutils/ix.sh' %}

{% block bld_libs %}
bld/boot/5/lib/compiler_rt
{% endblock %}

{% block bld_deps %}
bld/boot/6/env/std
bld/boot/5/patch
bld/boot/5/byacc
{% endblock %}
