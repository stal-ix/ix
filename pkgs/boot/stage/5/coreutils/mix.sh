{% extends '//gnu/coreutils/8.31/mix.sh' %}

{% block bld_deps %}
boot/stage/5/sed/mix.sh
boot/stage/5/gawk/mix.sh
boot/stage/5/grep/mix.sh
boot/stage/5/make/mix.sh
boot/stage/4/env/mix.sh
boot/stage/4/byacc/mix.sh
{% endblock %}
