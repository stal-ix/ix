{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://sourceware.org/elfutils/ftp/0.186/elfutils-0.186.tar.bz2
2c095e31e35d6be7b3718477b6d52702
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/fts
lib/zstd
lib/bzip2
lib/obstack
{% if bin %}
lib/intl
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/argp/standalone
{% endblock %}

{% block bld_tool %}
bin/m4
bin/gettext
{% endblock %}

{% block patch %}
mkdir sys && echo > sys/cdefs.h
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD} ${CPPFLAGS}"
{% endblock %}

{% block configure_flags %}
--disable-libdebuginfod
--disable-debuginfod
{% endblock %}

{% block build %}
make -C backends libebl_backends.a
make -C libcpu libcpu.a
make -C libdwelf libdwelf.a
make -C libebl libebl.a
make -C libdwfl libdwfl.a
make -C libdw libdw.a
make -C libelf libelf.a
{% endblock %}

{% block install %}
make -C libdw install-exec install-data
make -C libelf install-exec install-data
make -C libdwfl install-exec install-data
make -C libebl install-exec install-data
make -C libdwelf install-exec install-data
cp version.h ${out}/include/elfutils/
{% endblock %}
