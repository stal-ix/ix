{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/davmac314/dinit
{% endblock %}

{% block git_branch %}
v0.17.0
{% endblock %}

{% block git_sha %}
84bd7a94299ecc5f0d3dec81011dc0bff8b770da60b1fb92404e4dd5feb6443a
{% endblock %}

{% block git_refine %}
find . -type l -delete
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/m4
{% endblock %}

{% block meson_flags %}
dinit-sbindir=${out}/bin
dinit-control-socket-path=/var/run/dinit/ctl
{% endblock %}
