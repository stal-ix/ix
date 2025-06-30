{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/build
lib/freebsd/c/iso
lib/shim/fake(lib_name=gcc)
{% endblock %}
