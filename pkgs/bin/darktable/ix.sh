{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/darktable/unwrap(lua_ver=jit)
{% endblock %}
