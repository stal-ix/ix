{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.1.7/sbcl-2.1.7-source.tar.bz2
# md5 3f21dbcab14b4aa51b9a9f03c2b78b9c
{% endblock %}

{% block deps %}
# bld lib/dlfcn/mix.sh
# bld lib/z/mix.sh
# bld {{'lib/linux/mix.sh' | linux}}
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-DLISP_FEATURE_OS_PROVIDES_DLOPEN ${CPPFLAGS}"
export LDFLAGS="-Wl,-error-limit=0 ${LDFLAGS}"
{% endblock %}

{% block more_deps %}
# bld dev/lang/ecl/mix.sh
{% endblock %}

{% block patch %}
sed -e 's/lispobj \*static_code_space_free_pointer/extern lispobj \*static_code_space_free_pointer/' -i src/runtime/globals.h
sed -e 's/size_t os_vm_page_size/extern size_t os_vm_page_size/' -i src/runtime/arm64-bsd-os.c

cat << EOF > symbols
{% include 'symbols' %}
EOF

(
    echo '#include <dlfcn.h>'

    cat symbols | while read l; do
        echo 'extern "C" void* '$l';'
    done

    echo 'DL_LIB("sbcl")'

    cat symbols | while read l; do
        echo 'DL_S_2("'$l'", &'$l')';
    done

    echo 'DL_END()'
) > symbols.cpp
{% endblock %}

{% block boot_lisp %}
ecl -norc
{% endblock %}

{% block build %}
gcc -c symbols.cpp -o ${tmp}/symbols.o

export LDLIBS="${tmp}/symbols.o"

ulimit -s 60000

dash ./make.sh \
    --prefix=${out} \
    --xc-host='{{self.boot_lisp().strip()}}' \
    --with-sb-ldb \
    --with-sb-thread \
    --with-sb-core-compression
{% endblock %}

{% block install %}
dash ./install.sh
{% endblock %}
