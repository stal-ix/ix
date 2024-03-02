{% extends '//die/c/make.sh' %}

{% block make_tool %}
bin/pmake
{% endblock %}

{% block make_bin %}
pmake
{% endblock %}

{% block fetch %}
https://github.com/apple-oss-distributions/patch_cmds/archive/refs/tags/patch_cmds-61.tar.gz
sha:ac3934304c25be001a189c26a7cd01dfa3817d0a0f6a25aafd3e1649489b047d
{% endblock %}

{% block unpack %}
{{super()}}
cd patch
{% endblock %}

{% block bld_libs %}
lib/c
lib/bsd/overlay
{% endblock %}

{% block build_flags %}
shut_up
no_werror
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/fake/binutils
{% endblock %}

{% block cpp_missing %}
fcntl.h
unistd.h
sys/stat.h
{% endblock %}

{% block cpp_defines %}
d_namlen=d_reclen
st_mtimespec=st_mtim
__APPLE__
{% endblock %}

{% block make_flags %}
LD=ld
LINKER_TYPE=lld
MK_TESTS=no
BINDIR=${out}/bin
LIBDIR=${out}/lib
INCDIR=${out}/include
SHAREDIR=${out}/share
MK_INSTALL_AS_USER=yes
{% endblock %}

{% block patch %}
sed -e 's|util.c|util.c vcs.c|' -i Makefile
{% endblock %}

{% block install %}
mkdir -p ${out}/bin ${out}/lib ${out}/include ${out}/share/man/man1
{{super()}}
{% endblock %}
