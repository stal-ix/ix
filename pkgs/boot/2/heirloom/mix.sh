{% extends '//bin/heirloom/t/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/2/sbase
boot/2/bmake
boot/1/env
{% endblock %}

{% block heirloom_make %}bmake{% endblock %}
{% block heirloom_tools %}nawk grep diff cmp{% endblock %}
