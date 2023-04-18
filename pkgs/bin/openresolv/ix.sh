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
rm -rf etc
mkdir -p share/man
mv man* share/man/
{% endblock %}
