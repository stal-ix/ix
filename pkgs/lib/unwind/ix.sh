{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libunwind/libunwind/archive/refs/tags/v1.6.2.tar.gz
sha:b76546101ca00c5525ae939104ca1b9de4a444a61cfa9bfe7e505c66c4fb1f10
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
