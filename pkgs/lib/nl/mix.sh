{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/thom311/libnl/releases/download/libnl3_6_0/libnl-3.6.0.tar.gz
sha:532155fd011e5a805bd67121b87a01c757e2bb24112ac17e69cb86013b970009
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bld/flex
bin/bison/3/6
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/libnl3 \${CPPFLAGS}"
{% endblock %}
