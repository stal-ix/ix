{% extends '//mix/c_std.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.2.3/sbcl-2.2.3-source.tar.bz2
sha:de7f49e1f7750fd2cd89111ef70641cc5471355f621b737392ac68aa95f37f9f
{% endblock %}

{% block bld_libs %}
lib/z
{% if linux %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
{% block boot_lisp_dep %}
bin/ecl
{% endblock %}
bld/make
bld/scripts/dlfcn
{% endblock %}

{% block patch %}
sed -e 's/lispobj \*static_code_space_free_pointer/extern lispobj \*static_code_space_free_pointer/' -i src/runtime/globals.h
sed -e 's/size_t os_vm_page_size/extern size_t os_vm_page_size/' -i src/runtime/arm64-bsd-os.c

cat << EOF | dl_stubs sbcl > symbols.cpp
{% include 'symbols' %}
EOF
{% endblock %}

{% block boot_lisp %}
ecl -norc
{% endblock %}

{% block build %}
clang -c symbols.cpp -o ${tmp}/symbols.o

export LDLIBS="${tmp}/symbols.o"

ulimit -s 60000

sh make.sh \
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
