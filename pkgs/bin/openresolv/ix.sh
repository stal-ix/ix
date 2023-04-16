{% extends '//die/c/make.sh' %}

{% block fetch %}
https://roy.marples.name/downloads/openresolv/openresolv-3.12.0.tar.xz
sha:42b30508e857a228535c631eaac936862d86eca68c14b5c0bf387ba176b91b97
{% endblock %}

{% block make_flags %}
SBINDIR=/bin
DESTDIR="${out}"
LIBEXECDIR=/bin/bin_openresolv
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

mkdir -p share/man
mv man* share/man/

cd etc

cat << EOF > resolvconf.conf
name_servers="::1 127.0.0.1"
resolv_conf=/var/run/resolvconf/resolv.conf
unbound_conf=/var/run/resolvconf/unbound.conf
dnsmasq_conf=/var/run/resolvconf/dnsmasq_conf.conf
dnsmasq_resolv=/var/run/resolvconf/dnsmasq_resolv.conf
EOF

ln -s /var/run/resolvconf/resolv.conf resolv.conf
{% endblock %}

{% block purge_broken_links %}
{% endblock %}

{% block chmod_ro %}
{% endblock %}
