{% extends '//die/c/autohell.sh' %}

{% block fetch %}
{% include '//bin/binutils/t/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd bfd
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/zstd
lib/sframe
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}

{% block configure_flags %}
--with-zstd
--with-system-zlib
--enable-targets=all
--enable-install-libbfd
--enable-deterministic-archives
{% endblock %}

{% block install %}
{{super()}}
cp bfdver.h ${out}/include/
{% endblock %}

{% block patch %}
sed -e 's|../libsframe/libsframe.la||g' -i Makefile.in
{% endblock %}
