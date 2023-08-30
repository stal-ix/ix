{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/thom311/libnl/releases/download/libnl3_8_0/libnl-3.8.0.tar.gz
sha:bb726c6d7a08b121978d73ff98425bf313fa26a27a331d465e4f1d7ec5b838c6
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
