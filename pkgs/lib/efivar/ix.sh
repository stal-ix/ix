{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rhboot/efivar/archive/refs/tags/38.tar.gz
sha:e3bbde37238bd47af1fcf270dc0ef1f4be030d86364c917b93669222ec52bbea
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/popt
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/mandoc
{% endblock %}

{% block patch %}
ln -s libefivar.so src/libefivar.a
ln -s libefisec.so src/libefisec.a

sed -e 's|.*add-need.*|\\|' -i src/include/defaults.mk

mkdir sys

cat << EOF > sys/cdefs.h
#define on_exit(a, b)
EOF
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
efi_well_known_guids_=efi_well_known_guids
efi_well_known_names_=efi_well_known_names
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}

{% block make_flags %}
AR=llvm-ar
NM=llvm-ar
LD_DASH_T=-T
LIBDIR=${out}/lib
RANLIB=llvm-ranlib
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
cp ${out}/lib/libefivar.so ${out}/lib/libefivar.a
cp ${out}/lib/libefisec.so ${out}/lib/libefisec.a
cp ${out}/lib/libefiboot.so ${out}/lib/libefiboot.a
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/efivar \${CPPFLAGS}"
{% endblock %}
