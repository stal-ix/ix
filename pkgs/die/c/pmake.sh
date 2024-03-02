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
LD=ld
LINKER_TYPE=lld
BINDIR=${out}/bin
LIBDIR=${out}/lib
INCDIR=${out}/include
SHAREDIR=${out}/share
MK_TESTS=no
MK_INSTALL_AS_USER=yes
{% endblock %}

{% block step_install %}
mkdir -p ${out}/bin ${out}/lib ${out}/include ${out}/share/man/man1
{{super()}}
{% endblock %}
