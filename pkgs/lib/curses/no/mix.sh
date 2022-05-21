{% extends '//die/proxy.sh' %}

{% block env_lib %}
export COFLAGS="--disable-curses --disable-ncurses --without-curses \${COFLAGS}"
{% endblock %}
