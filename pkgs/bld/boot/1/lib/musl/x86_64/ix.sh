{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
musl
{% endblock %}

{% block version %}
1.2.4
{% endblock %}

{% block fetch %}
http://musl.libc.org/releases/musl-{{self.version().strip()}}.tar.gz
sha:7a35eae33d5372a7c0da1188de798726f68825513b7ae3ebe97aaaa52114f039
{% endblock %}

{% block lib_deps %}
lib/build
{% endblock %}

{% block bld_libs %}
lib/build
{% endblock %}

{% block bld_deps %}
bld/boot/1/sh
bld/boot/0/env
{% endblock %}

{% block unpack %}
cd ${out}
extract0 ${src}/musl*
cd musl*
{% endblock %}

{% block setup_compiler %}
source_env "${IX_T_DIR}"
setup_tc_here
{% endblock %}

{% block step_setup %}
export MFLAGS=
export MFLAGS="${MFLAGS} -iquote ${PWD}/arch/x86_64"
export MFLAGS="${MFLAGS} -iquote ${PWD}/src/internal"
export MFLAGS="${MFLAGS} -isystem ${PWD}/arch/x86_64"
export MFLAGS="${MFLAGS} -isystem ${PWD}/arch/generic"
export MFLAGS="${MFLAGS} -isystem ${PWD}/src/include"
export MFLAGS="${MFLAGS} -isystem ${PWD}/src/internal"
export MFLAGS="${MFLAGS} -isystem ${PWD}/include"
export CPPFLAGS="${MFLAGS} ${CPPFLAGS}"
export CFLAGS="-w ${MFLAGS} -D__STDC_HOSTED__ -D_XOPEN_SOURCE=700 -U_GNU_SOURCE ${CPPFLAGS} -ffreestanding -std=c99 ${CFLAGS} -O0 -fno-builtin -fno-stack-protector"
{{super()}}
{% endblock %}

{% block patch %}
cat << EOF > arch/x86_64/bits/alltypes.h
{% include 'alltypes.h' %}
EOF
cat << EOF > arch/x86_64/bits/syscall.h
{% include 'syscall.h' %}
EOF
cat << EOF > src/internal/version.h
#define VERSION "bootstrap"
EOF
>include/sys/cdefs.h
>include/sys/sysctl.h
{% endblock %}

{% block build %}
set +x

objs=""

for i in src/*; do
    for s in $i/*.c; do
        case $s in
            *\*.c)
            ;;
            *)
                objs="$s.o $objs"
                cc $s -c -o $s.o
            ;;
        esac
    done

    for s in $i/x86_64/*.s; do
        case $s in
            *\*.s)
            ;;
            *)
                objs="$s.o $objs"
                cc $s -c -o $s.o
            ;;
        esac
    done
done

for s in src/malloc/mallocng/*.c; do
    objs="$s.o $objs"
    cc $s -c -o $s.o
done

for s in crt/x86_64/*.s crt/crt1.c; do
    cc $s -c -o $s.o
    objs="$s.o $objs"
done

ar q libmusl.a $objs
ranlib libmusl.a

>empty.c

cc -o empty.o -c ./empty.c

for x in m pthread dl; do
    ar q lib${x}.a empty.o
    ranlib lib${x}.a
done
{% endblock %}

{% block env %}
# or sometimes gcc assume glibc, and insert unexpected fs:28 calls
export CFLAGS="-fno-stack-protector \${CFLAGS}"
export CPPFLAGS="${MFLAGS} \${CPPFLAGS}"
export LDFLAGS="-static -nostdlib -L${PWD} -lmusl \${LDFLAGS}"
{% endblock %}
