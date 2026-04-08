{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/irssi/irssi
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_commit %}
bcf07a2546b5adfecf0df56553f2e8be0920c6c5
{% endblock %}

{% block git_sha %}
b8c86fa1d141a6832ef4bc2b370bf4d05d9d3d7e0a7d02e8794f4c7920e4caec
{% endblock %}

{% block pkg_name %}
irssi
{% endblock %}

{% block version %}
1.4.5
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/kernel
lib/ncurses
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bld/perl
{% endblock %}

{% block meson_flags %}
with-perl=no
with-proxy=no
with-otr=no
enable-true-color=yes
{% endblock %}
