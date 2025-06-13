{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
yasm
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://github.com/yasm/yasm/releases/download/v{{self.version().strip()}}/yasm-{{self.version().strip()}}.tar.gz
3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/re2c
bld/python
bld/gettext
{% endblock %}

{% block patch %}
find . -type f | grep Makefile | while read l; do
    sed -e "s|\$.*re2c.*EXT)|re2c|" -i ${l}
done
{% endblock %}

{% block setup_target_flags %}
export CCLD_FOR_BUILD=${HOST_CC}
{% endblock %}
