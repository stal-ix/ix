{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~emersion/kanshi/archive/v1.5.0.tar.gz
sha:303676479dbd944204632e4baf7c20cf74ab8d9b218d98ffc531650632e8fc56
{% endblock %}

{% block bld_libs %}
lib/c
lib/varlink
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
