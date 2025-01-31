{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/jonas/tig/archive/refs/tags/tig-2.5.11.tar.gz
sha:f54f720378c4105a5d3df257e59386b2bd892bd01437f2c5769bd1813300d0b3
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
