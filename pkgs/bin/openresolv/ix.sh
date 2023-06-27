{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/NetworkConfiguration/openresolv/archive/refs/tags/v3.13.2.tar.gz
sha:e16b732b52df50e03fde3e37dd3fb642094248412afe78e6a7cf37c429ffe3ad
{% endblock %}

{% block make_flags %}
SBINDIR=/bin
DESTDIR="${out}"
LIBEXECDIR=/bin/bin_openresolv
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -rf etc
mkdir -p share/man
mv man* share/man/
{% endblock %}
