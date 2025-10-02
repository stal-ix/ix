{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
clifm
{% endblock %}

{% block version %}
1.26.3
{% endblock %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
902badc747aee1eb1a3a5556ff3fd9d83d2aa987d24e058024064df8a4b6b71f
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
