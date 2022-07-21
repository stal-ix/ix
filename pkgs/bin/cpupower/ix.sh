{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include '//bin/kernel/18/t/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/pciutils
{% endblock %}

{% block unpack %}
{{super()}}
cd tools/power/cpupower
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block setup %}
export LDFLAGS="-L${PWD} ${LDFLAGS}"
{% endblock %}

{% block build %}
ln -s libcpupower.so libcpupower.a
{{super()}}
{% endblock %}

{% block make_flags %}
CC=clang
libdir=${out}/lib
bindir=${out}/bin
sbindir=${out}/bin
mandir=${out}/doc
docdir=${out}/doc
confdir=${out}/share
includedir=${out}/include
localedir=${out}/share/locale
bash_completion_dir=${out}/share/bash-completion/completions
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libcpupower.so libcpupower.a
{% endblock %}
