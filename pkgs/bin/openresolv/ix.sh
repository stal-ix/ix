{% extends '//die/c/make.sh' %}

{% block pkg_name %}
openresolv
{% endblock %}

{% block version %}
3.17.0
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/openresolv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1fc3e29d65cd923c96f3b0923d0c0be1cfac263c14dae0bc05145b77e89287e1
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
