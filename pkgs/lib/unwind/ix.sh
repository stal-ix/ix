{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libunwind/libunwind/archive/refs/tags/v1.8.1.tar.gz
sha:38833b7b1582db7d76485a62a213706c9252b3dab7380069fea5824e823d8e41
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
--disable-minidebuginfo
--disable-zlibdebuginfo
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/include/unwind.h
{% endblock %}
