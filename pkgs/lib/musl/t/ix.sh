{% extends '//die/c/autohell.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/build
{% endblock %}

{% block configure_script %}
./configure
{% endblock %}

{% block setup %}
export PICFLAGS="-fno-pic -fno-pie"
export CPPFLAGS="${PICFLAGS} ${CPPFLAGS}"
{% endblock %}

{% block patch %}
cat << EOF > src/stdlib/dso_handle.c
void* __dso_handle = (void*)&__dso_handle;
EOF
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
ar q libcrt.a crt1.o crti.o crtn.o
ranlib libcrt.a
{% endblock %}

{% block env %}
export CMFLAGS="-DLIBCXX_HAS_MUSL_LIBC=yes \${CMFLAGS}"
export CPPFLAGS="${PICFLAGS} -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"

{% if x86_64 or aarch64 or riscv64 %}
export ac_cv_sizeof_off_t=8
export ac_cv_sizeof_size_t=8
export ac_cv_sizeof_ssize_t=8
{% endif %}

export lt_cv_dlopen=dlopen
export ac_cv_func_sbrk=yes
export lt_cv_dlopen_self=no
export ac_cv_func_strtod=yes
export ac_cv_func_fgetln=yes
export ac_cv_func_daemon=yes
export ac_cv_header_stdc=yes
export ac_cv_func_setenv=yes
export ac_cv_func_getenv=yes
export ac_cv_func_getline=yes
export ac_cv_func_sysconf=yes
export cf_cv_func_mkstemp=yes
export ac_cv_working_tzset=yes
export cf_cv_func_nanosleep=yes
export ac_cv_c_strptime_works=yes
export ac_cv_func_chown_works=yes
export ac_cv_have_decl_memmem=yes
export gl_cv_func_sigprocmask=yes
export ac_cv_header_stdbool_h=yes
export gl_cv_func_fflush_stdin=yes
export ac_cv_header_inttypes_h=yes
export ac_cv_func_gettimeofday=yes
export ac_cv_type_sighandler_t=yes
export ac_cv_func_getdtablesize=yes
export ac_cv_func_memcmp_working=yes
export ac_cv_func_working_mktime=yes
export gl_cv_func_realpath_works=yes
export ac_cv_func_mmap_fixed_mapped=yes
export gl_cv_header_working_fcntl_h=yes
export ac_cv_func_stat_empty_string_bug=no
export ac_cv_type_struct_sockaddr_storage=yes
export gl_cv_func_fchownat_nofollow_works=yes
export gl_cv_func_fchownat_empty_filename_works=yes
export gl_cv_func_posix_spawn_file_actions_addclose_works=yes
{% endblock %}

{% block test_lib %}
. ${out}/env

cat << EOF > main.c
#include <stdio.h>
#include <stdlib.h>

int main() {
    printf("hello!\n");
    exit(0);
}
EOF

${CC} -o main main.c ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}
{% endblock %}

{% block test_execute %}
./main
{% endblock %}
