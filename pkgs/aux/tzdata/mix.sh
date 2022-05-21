{% extends '//die/make.sh' %}

{% block fetch %}
https://data.iana.org/time-zones/releases/tzdb-2022a.tar.lz
sha:46123b769c55190138cf64e80db605b86f710dc6ca2a15df431966e7fd6e8490
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
