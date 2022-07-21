{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://matt.ucc.asn.au/dropbear/releases/dropbear-2022.82.tar.bz2
sha:3a038d2bbc02bf28bbdd20c012091f741a3ec5cbe460691811d714876aad75d1
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
