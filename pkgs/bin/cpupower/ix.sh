{% extends '//die/c/make.sh' %}

{% include '//bin/kernel/latest/ver.sh' %}

{% block lib_deps %}
lib/c
lib/pci/utils
{% endblock %}

{% block unpack %}
{{super()}}
cd tools/power/cpupower
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block setup_target_flags %}
export LDFLAGS="-L${PWD} ${LDFLAGS}"
{% endblock %}

{% block build %}
ln -s libcpupower.so libcpupower.a
{{super()}}
{% endblock %}

{% block make_flags %}
CC=clang
INSTALL=install
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
