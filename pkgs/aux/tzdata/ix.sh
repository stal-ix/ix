{% extends '//die/c/make.sh' %}

{% block fetch %}
https://data.iana.org/time-zones/releases/tzdb-2023c.tar.lz
sha:08fd090f1a16d522ae4e9247445056f4155002239e5be760b31ba0376d2e632c
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
