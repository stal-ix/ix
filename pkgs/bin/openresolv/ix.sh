{% extends '//die/c/make.sh' %}

{% block pkg_name %}
openresolv
{% endblock %}

{% block version %}
3.17.4
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/openresolv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
506937359aff4f5bb40f8646945aaf5647537f4040ec4988e334e03c3c126f6e
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
