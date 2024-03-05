{% extends 'make.sh' %}

{% block make_tool %}
bin/pmake
{% endblock %}

{% block make_bin %}
pmake
{% endblock %}

{% block std_box %}
{{super()}}
bld/fake/binutils
{% endblock %}

{% block make_flags %}
LD=clang
LINKER_TYPE=lld
X_LINKER_TYPE=lld
X_LINKER_VERSION=17.0.6
LINKER_VERSION=17.0.6
LDFLAGS=
BINDIR=${out}/bin
LIBDIR=${out}/lib
INCDIR=${out}/include
SHAREDIR=${out}/share
MK_TESTS=no
MK_INSTALL_AS_USER=yes
BINOWN=$(whoami)
BINGRP=$(whoami)
SHAREOWN=$(whoami)
SHAREGRP=$(whoami)
{% endblock %}

{% block step_install %}
mkdir -p ${out}/bin ${out}/lib ${out}/include ${out}/share/man/man1
{{super()}}
rm -rf ${out}/bin/.debug
{% endblock %}
