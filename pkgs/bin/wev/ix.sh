{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.sr.ht/~sircmpwn/wev/archive/1.0.0.tar.gz
sha:613a1df1a4879d50ce72023de14aaf05be2e6f51346e84a69f50fc6d8502bbf4
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/pkg/config
bld/wayland
{% endblock %}
