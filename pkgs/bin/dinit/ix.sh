{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/davmac314/dinit
{% endblock %}

{% block git_branch %}
v0.17.0
{% endblock %}

{% block git_sha %}
bfe46a426d376965e14dd78189b24e1594880d7ba1c48fd008ba4985467f90a1
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
