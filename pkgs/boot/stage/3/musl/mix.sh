{% extends '//lib/musl/template/mix.sh' %}

{% block bld_deps %}
boot/stage/3/make/mix.sh
boot/stage/2/env/mix.sh
{% endblock %}

{% block check_tools %}
{% endblock %}
