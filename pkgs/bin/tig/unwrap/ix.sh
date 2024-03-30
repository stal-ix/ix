{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/jonas/tig/archive/refs/tags/tig-2.5.9.tar.gz
sha:f759ec005bb918cab224df7e2a538b55b38f79762e925c359c13bfe2bc8fe48b
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
