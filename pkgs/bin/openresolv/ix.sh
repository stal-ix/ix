{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/NetworkConfiguration/openresolv/archive/refs/tags/v3.13.1.tar.gz
sha:04c9cde9afc54aea79f55da2423a4c3f22dc928b560a80436dc91dd4473b0b5b
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
