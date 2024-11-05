{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/unbound/{{libunbound_ver or 'openssl'}}
{% endblock %}
