{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libidn
{% endblock %}

{% block version %}
1.43
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libidn/libidn-{{self.version().strip()}}.tar.gz
sha:bdc662c12d041b2539d0e638f3a6e741130cdb33a644ef3496963a443482d164
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block patch %}
find . -type f -name '*.in.h' | while read l; do
    sed -e 's|@GNULIBHEADERS_OVERRIDE_WINT_T@|0|g' -i ${l}
done
{% endblock %}
