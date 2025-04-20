{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
uClibc
{% endblock %}

{% block version %}
0.9.33.2
{% endblock %}

{% block fetch %}
https://www.uclibc.org/downloads/uClibc-{{self.version().strip()}}.tar.xz
sha:62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp extra/scripts/getent ${out}/bin/
{% endblock %}
