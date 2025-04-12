{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
clifm
{% endblock %}

{% block version %}
1.24
{% endblock %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:fd279bcd8cfebaba1c6134ffdc0b429e2cd0b7d8ece94037bfb57cb210564a5e
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/acl
lib/magic
lib/readline
{% endblock %}

{% block cpp_defines %}
__END_DECLS=
__BEGIN_DECLS=
{% endblock %}
