{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/rhboot/efivar/archive/refs/tags/38.tar.gz
sha:e3bbde37238bd47af1fcf270dc0ef1f4be030d86364c917b93669222ec52bbea
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/popt
lib/linux
lib/qsort/r
{% endblock %}

{% block bld_tool %}
bin/mandoc
{% endblock %}

{% block setup_tools %}
ln -s $(which ar) gcc-ar
{% endblock %}

{% block patch %}
mkdir sys
cat << EOF > sys/cdefs.h
#include <qsort_r.h>
#define on_exit(a, b)
EOF

sed -e 's|all : $(TARGETS)|all : $(STATICTARGETS)|' \
    -e 's|$(LD_DASH_T)|-T|' -i src/Makefile

find . -type f | while read l; do
    sed -e 's|--add-needed|--as-needed|' \
        -e 's|efi_well_known_guids_|efi_well_known_guids|g' \
        -e 's|%s_\[|%s\[|g' -i ${l}
done
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD} -D_GNU_SOURCE=1 ${CPPFLAGS}"
{% endblock %}

{% block build %}
{{super()}}

cd src

mv efivar-static efivar
mv efisecdb-static efisecdb

>libefivar.so
>libefiboot.so
>libefisec.so
{% endblock %}

{% block install %}
{{super()}}

cp src/*.a ${out}/lib64/
cd ${out}; mv lib64 lib

find . -type f -name '*.pc' | while read l; do
    sed -e 's|lib64|lib|' -i ${l}
done
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/efivar \${CPPFLAGS}"
{% endblock %}
