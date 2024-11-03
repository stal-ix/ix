{% extends '//die/gen.sh' %}

{% block env %}
export COFLAGS="--disable-curses --disable-ncurses --without-curses \${COFLAGS}"
{% endblock %}
