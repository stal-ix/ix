{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/curl/{{libcurl_ver or 'full'}}
{% endblock %}

