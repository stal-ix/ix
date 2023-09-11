{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/neovim/unwrap(lua_ver=openresty)
{% endblock %}
