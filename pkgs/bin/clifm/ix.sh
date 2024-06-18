{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v1.19.tar.gz
sha:98fe9a1d26b02d661440787ae811363c97da537a11fd3df78ff98d40f42dc487
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
