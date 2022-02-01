{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/pg83/heirloom/archive/refs/tags/v1.tar.gz
sha:9bb2c524545ab88d5c7001f3be2f8228316577d84640db0fbde2b399bc81b147
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/4/byacc
boot/8/env/std
{% endblock %}

{% block unpack %}
{{super()}}
cd heirloom-devtools/lex
{% endblock %}

{% block c_rename_symbol %}
getopt
optarg
optind
optopt
opterr
{% endblock %}

{% block setup %}
export ROOT=
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
echo 'skip, cause /lib removal'
{% endblock %}
