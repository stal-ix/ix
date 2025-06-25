{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/dlfcn/{{libdlfcn_ver or 'unwrap'}}
{% endblock %}
