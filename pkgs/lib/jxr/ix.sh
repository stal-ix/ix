{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/glencoesoftware/jxrlib/archive/refs/tags/v0.2.4.tar.gz
sha:324af02e341bcb9e3b31a6d6892f47231f95f9f87ab4fe7645be619dcaf965a7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/python
bld/fake(tool_name=jrunscript)
{% endblock %}

{% block cpp_missing %}
wchar.h
{% endblock %}

{% block setup %}
export CFLAGS="-Wno-implicit-function-declaration ${CFLAGS}"
{% endblock %}

{% block make_flags %}
DIR_INSTALL=${out}
{% endblock %}

{% block patch %}
sed -e 's|$(DIR_BUILD)/libjxrjava.$(LIBSUFFIX)||' \
    -e 's|@python|python3|' \
    -i Makefile
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/libjxr/glue -I${out}/include/libjxr/common -I${out}/include/libjxr/image \${CPPFLAGS}"
{% endblock %}
