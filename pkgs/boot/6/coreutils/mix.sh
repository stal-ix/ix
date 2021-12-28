{% extends '//boot/4/coreutils/mix.sh' %}

{% block bld_libs %}
boot/4/lib/compiler_rt
{% endblock %}

{% block bld_deps %}
boot/5/env/std
boot/4/patch
boot/4/byacc
{% endblock %}
