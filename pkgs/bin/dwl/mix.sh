{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/djpohly/dwl/archive/refs/tags/v0.3.tar.gz
sha:
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/wlroots/14
{% endblock %}

{% block bld_tool %}
bin/pkg-config
bin/wayland/protocols
{% endblock %}
