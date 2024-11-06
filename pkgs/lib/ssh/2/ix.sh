{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/ssh/2/{{libssh2_ver or 'openssl'}}
{% endblock %}
