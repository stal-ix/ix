{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
loksh
{% endblock %}

{% block version %}
7.7
{% endblock %}

{% block git_repo %}
https://github.com/dimkr/loksh
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
9eb736a33947d829b8ae67868063bfac54e3527643cde430f6020c610545249d
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block patch %}
>subprojects/lolibc/reallocarray.c
{% endblock %}
