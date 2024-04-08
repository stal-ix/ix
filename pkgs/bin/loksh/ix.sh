{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/dimkr/loksh
{% endblock %}

{% block git_branch %}
7.5
{% endblock %}

{% block git_sha %}
7a298122f5b08c2c9c7a37b2f509641674f6467d867cf1b8acbffde460c2752b
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}
