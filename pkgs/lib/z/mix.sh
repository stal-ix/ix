{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/z/{{zlib_ver or 'ng'}}
{% endblock %}
