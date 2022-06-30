{% extends '//lib/lua/modules/t.sh' %}

{% block fetch %}
http://bitop.luajit.org/download/LuaBitOp-1.0.2.tar.gz
md5:d0c1080fe0c844e8477279668e2d0d06
{% endblock %}

{% block cpp_defines %}
{{super()}}
LUA_NUMBER_DOUBLE
{% endblock %}
