{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
dropbear
{% endblock %}

{% block fetch %}
https://github.com/mkj/dropbear/archive/refs/tags/DROPBEAR_{{self.version().strip()}}.tar.gz
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/tom/math
lib/tom/crypt
{% endblock %}

{% block configure_flags %}
--disable-bundled-libtom
{% endblock %}

{% block patch %}
rm -r libtommath
rm -r libtomcrypt
{% endblock %}
