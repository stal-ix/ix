{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/djpohly/dwl/archive/refs/tags/v0.3.tar.gz
sha:a3dd9b7107e9d324cc0dc4f48dd526fb687b10c9e63a42b33a827130d9113763
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/wlroots/15
{% endblock %}

{% block bld_tool %}
bin/pkg-config
bin/wayland/protocols
{% endblock %}
