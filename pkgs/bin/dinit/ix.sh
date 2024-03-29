{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/davmac314/dinit
{% endblock %}

{% block git_branch %}
v0.17.0
{% endblock %}

{% block git_sha %}
6167e7c38869ca9eea6ed27315e5c0ed6612d255e5cfbce141e0173ce4d5800d
{% endblock %}

{% block git_version %}
v3
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
