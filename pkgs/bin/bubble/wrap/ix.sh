{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
bubblewrap
{% endblock %}

{% block version %}
0.13.0
{% endblock %}

{% block fetch %}
https://github.com/containers/bubblewrap/releases/download/v{{self.version().strip()}}/bubblewrap-{{self.version().strip()}}.tar.xz
4734237473c0e5d695e4e9034a34e43b2dbf5164655bd13fa59ae376b2b7a765
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
