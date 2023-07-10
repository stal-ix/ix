{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ii8/havoc/archive/refs/tags/0.5.0.tar.gz
sha:3b0d37b13e3ca21f5e22f1e62a32fe736119cd5c601307c4000bed5fee179f77
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
{% endblock %}
