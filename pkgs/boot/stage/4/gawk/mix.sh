{% extends '//gnu/gawk/mix.sh' %}

{% block bld_deps %}
boot/stage/4/coreutils/mix.sh
boot/stage/4/byacc/mix.sh
boot/stage/3/env/mix.sh
{% endblock %}

{% block check_tools %}
{% endblock %}
