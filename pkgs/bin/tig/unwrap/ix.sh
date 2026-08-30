{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tig
{% endblock %}

{% block version %}
2.6.1
{% endblock %}

{% block fetch %}
https://github.com/jonas/tig/archive/refs/tags/tig-{{self.version().strip()}}.tar.gz
686967750b9b6331b9f8dedff73ca2e3a5eba3545f77a5af24e42ce6f0527a4c
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/pcre/2
lib/readline
{% endblock %}

{% block patch %}
sed -e 's|.*define.*NDEBUG.*||' -i include/tig/tig.h
{% endblock %}
