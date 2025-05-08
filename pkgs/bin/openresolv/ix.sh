{% extends '//die/c/make.sh' %}

{% block pkg_name %}
openresolv
{% endblock %}

{% block version %}
3.16.2
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/openresolv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:747ffde6d2b6507a984f54946a16d02eb03f12c981869550950f7a025bc3136b
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
