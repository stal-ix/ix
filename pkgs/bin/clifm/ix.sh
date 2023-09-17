{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v1.14.5.tar.gz
sha:60aa04cd6e6966107693499028765e13f1de30950d85d3ef29d44bc4d58467b9
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
