{% extends '//bin/m4/19/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz
md5:730bb15d96fffe47e148d1e09235af82
https://raw.githubusercontent.com/macports/macports-ports/edf0ee1e2cf/devel/m4/files/secure_snprintf.patch
md5:319c143996239e23d2fe3e7968a7620d
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/obstack
{% endblock %}

{% block bld_tool %}
bld/texinfo
{{super()}}
{% endblock %}

{% block patch %}
patch -p0 < ${src}/secure_snprintf.patch
{% endblock %}
