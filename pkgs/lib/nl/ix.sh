{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libnl
{% endblock %}

{% block version %}
3.12.0
{% endblock %}

{% block fetch %}
https://github.com/thom311/libnl/releases/download/libnl{{self.version().strip().replace('.', '_')}}/libnl-{{self.version().strip()}}.tar.gz
fc51ca7196f1a3f5fdf6ffd3864b50f4f9c02333be28be4eeca057e103c0dd18
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
