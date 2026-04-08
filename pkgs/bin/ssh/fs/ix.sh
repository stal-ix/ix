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
3f17dc9409bb6f64d6b4fb30e7c64352e2a39517fddc391ca3355a7f41371cd6
{% endblock %}

{% block pkg_name %}
sshfs
{% endblock %}

{% block version %}
3.7.5
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
