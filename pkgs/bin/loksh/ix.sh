{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
loksh
{% endblock %}

{% block version %}
7.6
{% endblock %}

{% block git_repo %}
https://github.com/dimkr/loksh
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
b002d6c7dea0d0547b36bc5bd91c2b804438531d2c35ba222b2e2ce226927ac5
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block patch %}
>subprojects/lolibc/reallocarray.c
{% endblock %}
