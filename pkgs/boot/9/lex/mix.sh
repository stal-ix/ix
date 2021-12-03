{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/pg83/heirloom/archive/a47c4acf9fb43b89f9fb0afdcf9008121d50d806.zip
19b59804cf21bf9bd266d9cb261ecb2c
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/4/byacc/mix.sh
boot/8/env/std/mix.sh
{% endblock %}

{% block unpack %}
{{super()}}
cd heirloom-devtools/lex
{% endblock %}

{% block setup %}
export ROOT=
export CPPFLAGS="-Dgetopt=h_getopt -Doptarg=h_optarg -Doptind=h_optind -Doptopt=h_optopt -Dopterr=h_opterr ${CPPFLAGS}"
export CFLAGS="-w ${CFLAGS}"
export BINDIR="${out}/bin"
export LIBDIR="${out}/lib"
export MANDIR="${out}/man"
{% endblock %}

{% block make_flags %}
-f Makefile.mk
CC=gcc
AR=ar
RANLIB=ranlib
INSTALL=install
STRIP=true
{% endblock %}

{% block postinstall %}
{% endblock %}
