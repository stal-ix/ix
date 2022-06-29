{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v3.4.2.tar.gz
sha:0acbca9fd9c0eeed7e5d9460ae2ea945d3f1f3d48e13a4c54da12c7e0d23c313
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
{% if linux %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/auto
bld/texinfo
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-system-ffi=yes --with-libffi-prefix=${out} \${COFLAGS}"
{% endblock %}
