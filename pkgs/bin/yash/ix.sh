{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/2.55/yash-2.55.tar.xz
sha:97cd809d5e216b3c4afae42379f1bd4f5082b7c16d51e282d60a5014fbc9e1f6
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
