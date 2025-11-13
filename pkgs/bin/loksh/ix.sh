{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
loksh
{% endblock %}

{% block version %}
7.8
{% endblock %}

{% block git_repo %}
https://github.com/dimkr/loksh
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
93635ccabea10f7b8fc5d77d54a562fe782dc82d15ccac1a403b4f41c37888cf
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block patch %}
>subprojects/lolibc/reallocarray.c
{% endblock %}
