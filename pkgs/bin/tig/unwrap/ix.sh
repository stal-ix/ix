{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tig
{% endblock %}

{% block version %}
2.6.0
{% endblock %}

{% block fetch %}
https://github.com/jonas/tig/archive/refs/tags/tig-{{self.version().strip()}}.tar.gz
e5c84bac827ba40e4ca9a311aeef4b93257b8cccd1b15e97ead44baea787786c
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
