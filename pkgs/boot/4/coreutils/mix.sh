{% extends '//gnu/coreutils/8.31/mix.sh' %}

{% block bld_deps %}
boot/4/patch/mix.sh
boot/4/byacc/mix.sh
boot/4/mawk/mix.sh
boot/3/env/mix.sh
{% endblock %}
