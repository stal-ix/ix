{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/iron/bar/unwrap(lua_ver=jit,gtk_ver=3)
{% endblock %}
