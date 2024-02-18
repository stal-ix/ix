{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
lib/lua/modules/lfs
{% endblock %}

{% block export_symbols %}
luaopen_lfs
{% endblock %}

{% block export_lib %}
lfs
{% endblock %}
