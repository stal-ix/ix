{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/mkj/dropbear/archive/refs/tags/DROPBEAR_2022.83.tar.gz
sha:e02c5c36eb53bfcd3f417c6e40703a50ec790a1a772269ea156a2ccef14998d2
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/tom/math
lib/tom/crypt
{% endblock %}

{% block enable_static %}
{% endblock %}

{% block configure_flags %}
--disable-bundled-libtom
{% endblock %}

{% block patch %}
rm -r libtommath
rm -r libtomcrypt
{% endblock %}
