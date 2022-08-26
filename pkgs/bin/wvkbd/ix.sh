{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v0.10.tar.gz
sha:28b3269ca9954f26816269df98b93986495691f23f0fb2a2d3a4e4bce0e8f1ea
{% endblock %}

{% block bld_libs %}
lib/c
lib/pango
lib/linux
lib/cairo
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
{% endblock %}
