{% extends '//gnu/coreutils/8.31/mix.sh' %}

{% block bld_deps %}
boot/stage/5/env/std/mix.sh
boot/stage/4/bsdpatch/mix.sh
boot/stage/4/byacc/mix.sh
{% endblock %}
