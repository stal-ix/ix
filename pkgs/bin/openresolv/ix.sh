{% extends '//die/c/make.sh' %}

{% block pkg_name %}
openresolv
{% endblock %}

{% block version %}
3.16.5
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/openresolv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:13f9094edfd2b2b92fde53c07fb82f28ed83e5b128bd2dcfba46a737d3d81a4e
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
