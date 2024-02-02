{% extends '//die/c/make.sh' %}

{% block fetch %}
https://data.iana.org/time-zones/releases/tzdb-2024a.tar.lz
sha:511af6b467f40b1ec9ac3684d1701793af470f3e29ddfb97b82be438e8601a7a
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
