{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tig
{% endblock %}

{% block version %}
2.5.12
{% endblock %}

{% block fetch %}
https://github.com/jonas/tig/archive/refs/tags/tig-{{self.version().strip()}}.tar.gz
sha:5e18e0404d2cb9657e9eff6cdbb2a073fe11449ae8cc0c779be0151fd9d46bdd
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
