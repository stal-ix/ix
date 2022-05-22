{% extends '//bin/heirloom/t/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/2/sbase
bld/boot/2/bmake
bld/boot/1/env
{% endblock %}

{% block heirloom_make %}bmake{% endblock %}
{% block heirloom_tools %}nawk grep diff cmp{% endblock %}
