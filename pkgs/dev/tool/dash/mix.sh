{% extends '//shell/cli/dash/mix.sh' %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}
