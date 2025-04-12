{% extends '//die/c/make.sh' %}

{% block version %}
3.14.1
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/openresolv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:72ae29f2e207039a8c55857fadc428026c26e9aa358cf772aa59cf635e643d4a
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
