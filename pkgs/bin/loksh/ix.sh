{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/dimkr/loksh/releases/download/7.2/loksh-7.2.tar.xz
sha:0083df24b3916c2f34ab63f8b4de6720ba9799e0e9d139c4b2d4ae41ad6aa53d
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}
