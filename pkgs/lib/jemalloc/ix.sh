{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
jemalloc
{% endblock %}

{% block version %}
5.4.0
{% endblock %}

{% block fetch %}
https://github.com/jemalloc/jemalloc/archive/refs/tags/{{self.version().strip()}}.tar.gz
077ad99d4bf61d03c01a35e8f765d245cab777b429498ddded9490f1d8c0935b
{% endblock %}

{% block autoreconf %}
autoconf
{% endblock %}

{% block configure_flags %}
--disable-cxx
--disable-libdl
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libjemalloc_pic.a
{% endblock %}

{% block lib_deps %}
lib/c/naked
lib/reallocarray
{% endblock %}

{% block bld_libs %}
lib/c++/dispatch
lib/bumpalloc/small
lib/compiler_rt/builtins
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines1 %}
{% if linux %}
JEMALLOC_BACKGROUND_THREAD=1
{% endif %}
{% endblock %}

{% block env %}
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
