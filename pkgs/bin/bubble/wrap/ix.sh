{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
bubblewrap
{% endblock %}

{% block version %}
0.13.1
{% endblock %}

{% block fetch %}
https://github.com/containers/bubblewrap/releases/download/v{{self.version().strip()}}/bubblewrap-{{self.version().strip()}}.tar.xz
0e85c8702248b8dd64144f594147553650cdd0e4c951690345faace79c217c4d
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
