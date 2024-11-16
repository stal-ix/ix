{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/9/env/cxx
{% endblock %}

{% block ind_deps %}
bld/boot/9/lib/c
{% endblock %}
