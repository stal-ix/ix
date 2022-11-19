{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~emersion/kanshi/refs/download/v1.3.0/kanshi-1.3.0.tar.gz
sha:e6ad6629be4e135796f098131e02ca783a3a1702f0b2cf4f80441542d73513cf
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
