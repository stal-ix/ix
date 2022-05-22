{% extends '//die/autohell.sh' %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/2.52/yash-2.52.tar.xz
6bce1383a3c7a51f49525188032d1c1a
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
