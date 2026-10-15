{% extends '//die/c/make.sh' %}

{% block version %}
2026e
{% endblock %}

{% block pkg_name %}
tzdb
{% endblock %}

{% block fetch %}
https://data.iana.org/time-zones/releases/tzdb-{{self.version().strip()}}.tar.lz
4e9c4e9d4587443e716ed42a7070466c1e5975938fb530244a17cf6db883990b
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
USRDIR=
DESTDIR=${out}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -r etc sbin
mkdir etc
ln -s ${out}/share/zoneinfo etc/
{% endblock %}
