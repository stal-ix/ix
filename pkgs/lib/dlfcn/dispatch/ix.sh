{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/dlfcn/{{libdlfcn_ver or 'latest'}}
{% endblock %}
