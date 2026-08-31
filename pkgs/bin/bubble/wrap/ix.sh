{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
bubblewrap
{% endblock %}

{% block version %}
0.12.0
{% endblock %}

{% block fetch %}
https://github.com/containers/bubblewrap/releases/download/v{{self.version().strip()}}/bubblewrap-{{self.version().strip()}}.tar.xz
9760d007363e3abba7c747489910f9f82d9fca53ba3bd3282e396fa3c97a3314
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
{% endblock %}

{% block cpp_missing %}
limits.h
{% endblock %}

{% block meson_flags %}
selinux=disabled
man=disabled
tests=false
bash_completion=disabled
zsh_completion=disabled
{% endblock %}
