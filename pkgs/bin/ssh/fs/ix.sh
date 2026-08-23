{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/libfuse/sshfs
{% endblock %}

{% block git_branch %}
sshfs-{{self.version().strip()}}
{% endblock %}

{% block git_commit %}
9e35c39ba83f54a49a9df4bf0a629f26c60cc38c
{% endblock %}

{% block git_sha %}
4866ff12768f5ecc9b1af92259c4045cbe80deb84e1cd24e9a4642d0ee96b7f2
{% endblock %}

{% block pkg_name %}
sshfs
{% endblock %}

{% block version %}
3.7.6
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/fuse/3
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
