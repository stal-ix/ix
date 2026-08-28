{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
clifm
{% endblock %}

{% block version %}
1.28
{% endblock %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
65ac33825fb55d6388c1044572e464a50ad367b607448774fb396d850b7c4420
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
