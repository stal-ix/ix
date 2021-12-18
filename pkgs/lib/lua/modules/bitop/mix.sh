{% extends '//lib/lua/modules/t.sh' %}

{% block fetch %}
http://bitop.luajit.org/download/LuaBitOp-1.0.2.tar.gz
d0c1080fe0c844e8477279668e2d0d06
{% endblock %}

{% block setup %}
{{super()}}
export CPPFLAGS="-DLUA_NUMBER_DOUBLE ${CPPFLAGS}"
{% endblock %}
