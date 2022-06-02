{% extends '//die/c_std.sh' %}

{% block bld_libs %}
lib/z
{% if linux %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/bash
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
{% block extern_symbols %}
{% include 'libc' %}
{% include 'libz' %}
{% include 'sbcl' %}
{% endblock %}
EOF

sed -e '5,$d' -i contrib/sb-posix/posix-tests.lisp
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
