{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/2.54/yash-2.54.tar.xz
sha:44a0ac1ccf7c3acecfbea027d8c0c930f13a828065be318055ce113015391839
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
