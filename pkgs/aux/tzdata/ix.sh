{% extends '//die/c/make.sh' %}

{% block version %}
2025b
{% endblock %}

{% block pkg_name %}
tzdb
{% endblock %}

{% block fetch %}
https://data.iana.org/time-zones/releases/tzdb-{{self.version().strip()}}.tar.lz
ec2f98c739009fd81a654efe2ee75069f54bcee5e0d80f510ee7e1f469ed293a
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
