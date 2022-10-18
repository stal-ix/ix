{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v1.8.tar.gz
sha:e202cc272145c1d322fb32421e96a6ba90110fe773f62647efd042f7f02063c4
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/acl
lib/magic
lib/readline
{% endblock %}
