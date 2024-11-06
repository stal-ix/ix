{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/gnutls/{{libgnutls_ver or 'pure'}}
lib/gnutls/register
{% endblock %}
