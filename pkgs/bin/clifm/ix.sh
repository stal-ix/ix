{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
clifm
{% endblock %}

{% block version %}
1.27.1
{% endblock %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a35cd1ccbb83f1261c3c5b14b5b4733cf0555be68579b3cb19fa8b36076a5339
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
