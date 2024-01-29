{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/fuse/{{fuse_ver or '3'}}
{% endblock %}
