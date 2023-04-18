{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/NetworkConfiguration/openresolv/archive/refs/tags/openresolv-3.13.0.tar.gz
sha:799d075542185217dcdaec00f32d7b92000d89029d29e50645a5d2a39736921b
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
