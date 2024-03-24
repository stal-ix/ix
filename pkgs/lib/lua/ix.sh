{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/lua/{{lua_ver | defined('lua_ver')}}
{% endblock %}
