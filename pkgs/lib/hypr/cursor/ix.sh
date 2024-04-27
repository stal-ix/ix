{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprcursor/archive/refs/tags/v0.1.8.tar.gz
sha:853692df9b649b92453baf28cb4cbc38013ab624113a14a8efa507c71a3cb46a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/zip
lib/cairo
lib/hypr/lang
lib/toml/plus/plus
{% endblock %}

{% block bld_libs %}
lib/hypr/rsvg
{% endblock %}
