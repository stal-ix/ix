{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v1.12.tar.gz
sha:a4cd97d7aa184a60e3e42ff33e6a31161818149c80caa92282cd2118e73319eb
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
