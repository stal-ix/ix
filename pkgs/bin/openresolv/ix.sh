{% extends '//die/c/make.sh' %}

{% block pkg_name %}
openresolv
{% endblock %}

{% block version %}
3.16.0
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/openresolv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:c63a747c39eef2ea505a6c2ae1f1dad8a286053f57dbd01820f2d14362cf635f
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
