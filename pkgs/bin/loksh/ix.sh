{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
loksh
{% endblock %}

{% block version %}
7.9
{% endblock %}

{% block git_repo %}
https://github.com/dimkr/loksh
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
3e046a38b747b072fe85e057f2e35932decdae329a445ac66d9523f1b131749b
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block patch %}
>subprojects/lolibc/reallocarray.c
{% endblock %}
