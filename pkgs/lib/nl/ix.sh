{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/thom311/libnl/releases/download/libnl3_7_0/libnl-3.7.0.tar.gz
sha:9fe43ccbeeea72c653bdcf8c93332583135cda46a79507bfd0a483bb57f65939
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/flex
bin/bison/3/6
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/libnl3 \${CPPFLAGS}"
{% endblock %}
