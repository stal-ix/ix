{% extends '//die/c/make.sh' %}

{% block fetch %}
https://data.iana.org/time-zones/releases/tzdb-2022g.tar.lz
sha:579013083a7b0fd8d71b02a69f062fa96c7b34b6a96646293f60ba9e1105bd2b
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
