{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://luajit.org/download/LuaJIT-2.0.5.tar.gz
48353202cbcacab84ee41a5a70ea0a2c
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block make_flags %}
BUILDMODE=static
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/luajit-2.0 \${CPPFLAGS}"
{% endblock %}
