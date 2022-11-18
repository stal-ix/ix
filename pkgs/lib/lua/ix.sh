{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/lua/{{lua_ver or 'jit'}}
{% endblock %}
