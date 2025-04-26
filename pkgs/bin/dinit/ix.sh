{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/davmac314/dinit
{% endblock %}

{% block pkg_name %}
dinit
{% endblock %}

{% block version %}
0.19.3
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
e73c2cbca8ddc2e7474f7044658786c889a1a10e0fc488c6f7270cbaa5b7bb67
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
