{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/NetworkConfiguration/openresolv/archive/refs/tags/v3.14.0.tar.gz
sha:5022b38dc0815b56bd980c6f827ea51d144fdc0db8e51f2f38a2876d97df3819
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
