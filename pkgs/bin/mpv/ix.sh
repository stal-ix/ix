{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if linux %}
bin/mpv/unwrap(lua_ver=jit)
{% else %}
bin/mpv/unwrap(lua_ver=puc/5/2)
{% endif %}
{% endblock %}
