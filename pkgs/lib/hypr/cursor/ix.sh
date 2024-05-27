{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprcursor/archive/refs/tags/v0.1.9.tar.gz
sha:313cd91436af343918e6dec4a666d4bf3666149ac3cac6f36c683b70304eada4
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
