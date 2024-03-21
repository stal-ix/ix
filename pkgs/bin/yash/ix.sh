{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/2.56.1/yash-2.56.1.tar.xz
sha:f7f5a1ffd246692568e4823a59b20357317d92663573bd1099254c0c89de71f5
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
