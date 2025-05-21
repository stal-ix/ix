{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
apr
{% endblock %}

{% block version %}
1.7.6
{% endblock %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-{{self.version().strip()}}.tar.bz2
sha:49030d92d2575da735791b496dc322f3ce5cff9494779ba8cc28c7f46c5deb32
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/apr-1 \${CPPFLAGS}"
export COFLAGS="--with-apr=${out}/bin/apr-1-config \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
{% if linux %}
--with-devrandom=/dev/random
{% endif %}
--with-installbuilddir=${out}/share/build
{% endblock %}

{% block setup_target_flags %}
{# educated cross-compile guess, broke with clang 16 #}
export ac_cv_type_pid_t=yes
export ac_cv_sizeof_pid_t=4
export ac_cv_sizeof_struct_iovec=16
{% if linux %}
export ac_cv_file__dev_zero=yes
export apr_cv_tcp_nodelay_with_cork=yes
export ac_cv_define_PTHREAD_PROCESS_SHARED=yes
export apr_cv_process_shared_works=yes
export apr_cv_mutex_robust_shared=yes
export ap_cv_atomic_builtins=yes
export apr_cv_mutex_recursive=yes
export apr_cv_epoll=yes
export apr_cv_epoll_create1=yes
export apr_cv_dup3=yes
export apr_cv_accept4=yes
export apr_cv_sock_cloexec=yes
export ac_cv_struct_rlimit=yes
export ac_cv_func_sem_open=yes
export ac_cv_negative_eai=yes
export apr_cv_gai_addrconfig=yes
export ac_cv_o_nonblock_inherited=no
export apr_cv_pthreads_lib=-lpthread
{% endif %}
{% endblock %}
