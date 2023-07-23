{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libunwind/libunwind/archive/refs/tags/v1.7.1.tar.gz
sha:f0b72f1511f86ed55e76c3510d7c0f614bf8568a66ef551f15b61a12a48f9eac
{% endblock %}

{# can not use full lib/c here, cause libc++-16 contains incompatible libunwind.h #}

{% block lib_deps %}
lib/c/naked
lib/ucontext
{% endblock %}

{% block bld_libs %}
lib/bumpalloc/small
{% endblock %}

{% block configure_flags %}
--disable-tests
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/include/unwind.h
{% endblock %}
