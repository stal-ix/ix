{% extends '//die/hub.sh' %}

{% block ind_deps %}
bld/boot/0/ind
{% endblock %}

{% block run_deps %}
bld/boot/0/sys
bld/boot/0/extract
{% endblock %}
