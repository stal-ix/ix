{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v1.21.tar.gz
sha:cb219ca6ce1b4a31ec98701a43da51142c8bc7f15a22cb81dda93f881e6f6877
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
