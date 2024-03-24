{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v1.18.tar.gz
sha:b3293074a62542c0ba54bd246391f9e38e0d48ea80c222bf8112469cb97a550c
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
