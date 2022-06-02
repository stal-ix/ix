{% extends '//die/c_std.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.2.1/sbcl-2.2.1-source.tar.bz2
sha:5dd6e6e3f08b7c6edf262a0e844a9f8b5e562cca08155034c1f2c014fc9087da
{% endblock %}

{% block bld_libs %}
lib/z
{% if linux %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/bash
{% block boot_lisp_dep %}
bin/ecl
{% endblock %}
bld/make
bld/scripts/dlfcn
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e "s|/bin/sh|$(which bash)|g" -l ${l}
done

sed -e 's/lispobj \*static_code_space_free_pointer/extern lispobj \*static_code_space_free_pointer/' -i src/runtime/globals.h
sed -e 's/size_t os_vm_page_size/extern size_t os_vm_page_size/' -i src/runtime/arm64-bsd-os.c

cat << EOF | sort | uniq | (while read l; do echo "sbcl ${l} ${l}"; done) | dl_stubs > symbols.c
{% include 'libc' %}
{% include 'libz' %}
{% include 'sbcl' %}
EOF

sed -e '5,$d' -i contrib/sb-posix/posix-tests.lisp
{% endblock %}

{% block boot_lisp %}
ecl -norc
{% endblock %}

{% block build %}
clang -fno-builtin -c symbols.c -o ${tmp}/symbols.o

export LDLIBS="${tmp}/symbols.o"

ulimit -s 60000

sh make.sh sbcl \
    --prefix=${out} \
    --xc-host='{{self.boot_lisp().strip()}}' \
    --with-sb-ldb \
    --with-sb-thread \
    --with-sb-core-compression \
    --with-os-provides-dlopen
{% endblock %}

{% block install %}
sh install.sh
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): move sbcl.core to proper place'
{% endblock %}
