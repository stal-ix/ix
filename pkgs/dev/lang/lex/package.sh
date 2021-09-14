{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/heirloom/archive/a47c4acf9fb43b89f9fb0afdcf9008121d50d806.zip
# md5 19b59804cf21bf9bd266d9cb261ecb2c
{% endblock %}

{% block deps %}
# bld dev/build/make dev/lang/byacc env/std
{% endblock %}

{% block postunpack %}
cd heirloom-devtools/lex
{% endblock %}

{% block cflags %}
export ROOT=
export CPPFLAGS="-Dgetopt=h_getopt -Doptarg=h_optarg -Doptind=h_optind -Doptopt=h_optopt -Dopterr=h_opterr ${CPPFLAGS}"
export CFLAGS="-w ${CFLAGS}"
export BINDIR="${out}/bin"
export LIBDIR="${out}/lib"
export MANDIR="${out}/man"
{% endblock %}

{% block build %}
make -f Makefile.mk CC=gcc AR=ar RANLIB=ranlib
{% endblock %}

{% block install %}
make -f Makefile.mk INSTALL=install STRIP=true install
{% endblock %}
