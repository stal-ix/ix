{% extends '//die/c/make.sh' %}

{% block fetch %}
https://data.iana.org/time-zones/releases/tzdb-2022c.tar.lz
sha:2e178330282e2832731e27136c3bc6f9eaf94a2c6b42691517151b349f751b24
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
