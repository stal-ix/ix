{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/nss
{% endblock %}

{% block export_libs %}
libsoftokn.a
{% endblock %}

{% block export_lib %}
softokn3
{% endblock %}
