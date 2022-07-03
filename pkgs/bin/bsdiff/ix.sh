{% extends '//die/make.sh' %}

{% block fetch %}
https://distfiles.macports.org/bsdiff/bsdiff-4.3.tar.gz
sha:18821588b2dc5bf159aa37d3bcb7b885d85ffd1e19f23a0c57a58723fea85f48
{% endblock %}

{% block bld_libs %}
lib/c
lib/bzip/2
{% endblock %}

{% block bld_tool %}
bld/bmake
{% endblock %}

{% block make_bin %}
bmake
{% endblock %}

{% block make_flags %}
INSTALL=install
{% endblock %}

{% block patch %}
find . -type f -name '*.c' | while read l; do
    sed -e 's|u_char|unsigned char|' -i ${l}
done
{% endblock %}

{% block install %}
mkdir -p ${out}/bin ${out}/man/man1
{{super()}}
{% endblock %}
