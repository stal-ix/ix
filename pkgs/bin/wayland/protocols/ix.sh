{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wayland-project/wayland-protocols/archive/refs/tags/1.26.tar.gz
sha:fe56386f436a84e97c3b6a61b76306f205a64425900f247ad0048174b9c32d4d
{% endblock %}

{% block bld_tool %}
bin/wayland/scanner
{% endblock %}

{% block run_deps %}
bin/wayland/scanner
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/wayland
{% endblock %}

{% block strip_pc %}
{% endblock %}
