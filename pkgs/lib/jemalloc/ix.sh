{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/jemalloc/jemalloc/archive/refs/tags/5.3.0.tar.gz
sha:ef6f74fd45e95ee4ef7f9e19ebe5b075ca6b7fbe0140612b2a161abafb7ee179
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
lib/bumpalloc/small
lib/c++/dispatch
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines %}
JEMALLOC_BACKGROUND_THREAD=1
{% endblock %}

{% block env %}
export ac_cv_func_malloc_0_nonnull=yes
{% endblock %}
