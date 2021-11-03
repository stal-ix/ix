{% extends '//gnu/coreutils/8.31/mix.sh' %}

{% block bld_deps %}
boot/stage/3/env/mix.sh
boot/stage/4/byacc/mix.sh
{% endblock %}
