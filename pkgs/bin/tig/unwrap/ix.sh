{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/jonas/tig/archive/refs/tags/tig-2.5.8.tar.gz
sha:d8cbfe4ede9d79b0da93d9002e79e8e466d5b4d2eee3dfa3dabf9cd5551a51c9
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/readline
lib/pcre/2/posix
{% endblock %}

{% block patch %}
sed -e 's|.*define.*NDEBUG.*||' -i include/tig/tig.h
{% endblock %}
