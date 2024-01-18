{% extends '//die/c/make.sh' %}

{% block fetch %}
http://musl.libc.org/releases/musl-1.2.4.tar.gz
sha:7a35eae33d5372a7c0da1188de798726f68825513b7ae3ebe97aaaa52114f039
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/compiler_rt/builtins/hack/pic
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
    --enable-shared \
    --disable-static \
    --syslibdir=${out}/bin
{% endblock %}

{% block postinstall %}
cat << EOF > gcc.c
void _Unwind_Backtrace() {
}

void _Unwind_DeleteException() {
}

void _Unwind_FindEnclosingFunction() {
}

void _Unwind_GetCFA() {
}

void _Unwind_GetDataRelBase() {
}

void _Unwind_GetIP() {
}

void _Unwind_GetIPInfo() {
}

void _Unwind_GetLanguageSpecificData() {
}

void _Unwind_GetRegionStart() {
}

void _Unwind_GetTextRelBase() {
}

void _Unwind_RaiseException() {
}

void _Unwind_Resume() {
}

void _Unwind_Resume_or_Rethrow() {
}

void _Unwind_SetGR() {
}

void _Unwind_SetIP() {
}
EOF

cc -o ${out}/lib/libgcc_s.so.1 -shared gcc.c
{% endblock %}

{% block env %}
export LDSO=${out}/bin/ld-musl-x86_64.so.1
export LD_LIBRARY_PATH=${out}/lib
export LDFLAGS="-L${out}/lib"
{% endblock %}
