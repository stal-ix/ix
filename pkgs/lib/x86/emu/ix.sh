{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libx86emu
{% endblock %}

{% block version %}
3.7
{% endblock %}

{% block fetch %}
https://github.com/wfeldt/libx86emu/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:03754aede79530baa0e862e1aad5527e9c1bd3371736b1ab5a2bc769e4a3d680
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_target %}
shared
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
VERSION={{self.version().strip()}}
LIBDIR=lib
DESTDIR=${out}/
BRANCH={{self.version().strip()}}
MAJOR_VERSION‎=1
{% endblock %}

{% block patch %}
rm git2log
echo '{{self.version().strip()}}' > VERSION
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv usr/include ./
rm -rf usr
{% endblock %}
