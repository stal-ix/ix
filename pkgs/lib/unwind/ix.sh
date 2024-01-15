{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libunwind/libunwind/archive/refs/tags/v1.8.0.tar.gz
sha:5bddae0096d5e66bf6299e46d31f7c727bdf9fccbdbd8e1b6ffd9b1f6142cd2e
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
