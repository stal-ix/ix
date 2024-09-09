{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mpv/unwrap(lua_ver=jit)
{% endblock %}
