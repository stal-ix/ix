{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/neo/vim/unwrap(lua_ver=openresty)
{% endblock %}
