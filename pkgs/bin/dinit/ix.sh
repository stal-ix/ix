{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/davmac314/dinit
{% endblock %}

{% block git_commit %}
306a2f37b9f153422ee2668b9abb1f5f8b4a961f
{% endblock %}

{% block git_sha %}
243a9161ee7b985b14773721796a822cddd845811b3982ce0e8141c645be765a
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
