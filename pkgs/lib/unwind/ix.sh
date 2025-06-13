{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libunwind
{% endblock %}

{% block version %}
1.8.2
{% endblock %}

{% block fetch %}
https://github.com/libunwind/libunwind/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3b888e01f3d25f7914bbfd31139066bb4547e079322975134b03c92e4c6a2066
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
