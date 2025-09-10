{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libunwind
{% endblock %}

{% block version %}
1.8.3
{% endblock %}

{% block fetch %}
https://github.com/libunwind/libunwind/archive/refs/tags/v{{self.version().strip()}}.tar.gz
21b26bc75cd37b548d7952f2794cde711efa6c6151c4147cc3c52cfedbf11df4
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
