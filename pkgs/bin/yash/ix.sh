{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/2.53/yash-2.53.tar.xz
sha:e430ee845dfd7711c4f864d518df87dd78b40560327c494f59ccc4731585305d
{% endblock %}

{% block bld_libs %}
lib/c
lib/edit
lib/curses
{% endblock %}

{% block c_rename_symbol %}
vfree
wordfree
add_history
{% endblock %}

{% block configure %}
sh configure --prefix="${out}" --with-term-lib=ncurses
{% endblock %}
