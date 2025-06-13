{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gperftools
{% endblock %}

{% block version %}
2.16
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-{{self.version().strip()}}/gperftools-{{self.version().strip()}}.tar.gz
f12624af5c5987f2cc830ee534f754c3c5961eec08004c26a8b80de015cf056f
{% endblock %}

{% block lib_deps %}
lib/reallocarray
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/c/naked
lib/bumpalloc/small
lib/compiler_rt/builtins
{% endblock %}

{% block patch %}
# disable mmap hooks
sed -e 's|defined(__linux)|0|' -i src/malloc_hook.cc
{% endblock %}

{% block configure_flags %}
--disable-cpu-profiler
--disable-heap-profiler
--disable-heap-checker
--disable-debugalloc
--enable-minimal
--disable-deprecated-pprof
--enable-sized-delete
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|.*HAVE_STRUCT_MALLINFO.*||' \
    -e 's|.*HAVE_SYS_CDEFS_H.*||' \
    -i src/config.h
{% endblock %}

{% block cpp_defines %}
{{super()}}
__environ=environ
{% endblock %}

{% block env %}
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
