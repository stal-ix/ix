{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/gnutls
{% endblock %}

{% block export_libs %}
libgnutls.a
{% endblock %}

{% block export_lib %}
gnutls
{% endblock %}
