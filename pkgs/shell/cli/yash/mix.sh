{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/magicant/yash/releases/download/2.51/yash-2.51.tar.xz
# md5 91d0c0fa548c9c9a081893f515b4f049
{% endblock %}

{% block bld_deps %}
lib/curses/any/mix.sh
lib/edit/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Dwordfree=yash_wordfree -Dadd_history=yash_add_history ${CPPFLAGS}"
{% endblock %}

{% block configure %}
dash ./configure --prefix="${out}" --with-term-lib=ncurses
{% endblock %}
