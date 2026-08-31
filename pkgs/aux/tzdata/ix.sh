{% extends '//die/c/make.sh' %}

{% block version %}
2026c
{% endblock %}

{% block pkg_name %}
tzdb
{% endblock %}

{% block fetch %}
https://data.iana.org/time-zones/releases/tzdb-{{self.version().strip()}}.tar.lz
427a11b1c5f2ebccad18f11650221c4f0465b4f1bb7f44dd02ff192d2808d944
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
