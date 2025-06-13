{% extends '//lib/lua/modules/t.sh' %}

# check bin/neo/vim

{% block pkg_name %}
LuaBitOp
{% endblock %}

{% block version %}
1.0.3
{% endblock %}

{% block fetch %}
http://bitop.luajit.org/download/LuaBitOp-{{self.version().strip()}}.tar.gz
d514a3d2cefa76c8d11c1b9ec740d5fae316a9c9764e1e12ddea21e4982fab4b
{% endblock %}

{% block cpp_defines %}
{{super()}}
LUA_NUMBER_DOUBLE
{% endblock %}
