{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/thom311/libnl/releases/download/libnl3_9_0/libnl-3.9.0.tar.gz
sha:aed507004d728a5cf11eab48ca4bf9e6e1874444e33939b9d3dfed25018ee9bb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/libnl3 \${CPPFLAGS}"
{% endblock %}
