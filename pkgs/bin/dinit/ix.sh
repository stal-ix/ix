{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/davmac314/dinit
{% endblock %}

{% block git_commit %}
306a2f37b9f153422ee2668b9abb1f5f8b4a961f
{% endblock %}

{% block git_sha %}
5449069eb4b143098e7d5c1b0c90987f9cb4c88926e041ffcb2b42a217fb45a3
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
