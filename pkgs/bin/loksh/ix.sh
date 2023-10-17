{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/dimkr/loksh/releases/download/7.4/loksh-7.4.tar.xz
sha:14636f794e939817f79653e00b2af7e73a199e585d52055455c15b9203caf299
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}
