{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/dimkr/loksh/releases/download/7.3/loksh-7.3.tar.xz
sha:e60bee39836432024569f44b499581ef8ebedbd8fe5b6172245e9a1af4304e9b
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}
