{% extends '//die/c/make.sh' %}

{% block version %}
2026f
{% endblock %}

{% block pkg_name %}
tzdb
{% endblock %}

{% block fetch %}
https://data.iana.org/time-zones/releases/tzdb-{{self.version().strip()}}.tar.lz
357829e3a16a78224d23f1ae2327704c1da1fd35f6769a7aac0682755fb9027a
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
