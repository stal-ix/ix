{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
clifm
{% endblock %}

{% block version %}
1.26
{% endblock %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2f5e5e2412307ea9e4e836b441785b325de58e12150629e81364f4da9adf4f01
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
