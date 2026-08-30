{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
mdevd
{% endblock %}

{% block version %}
0.1.8.2
{% endblock %}

{% block fetch %}
https://github.com/skarnet/mdevd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
23e242d70492b5381cab2227dd5b5407f748e52fe7a5df919a352c8dae26919d
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/skalibs
{% endblock %}

{% block patch %}
sed -e 's|mkdirp|mdevd_mkdirp|g' -i src/mdevd/mdevd.c
{% endblock %}

{% block make_flags %}
{{super()}}
VPATH=${MAKE_VPATH}
{% endblock %}
