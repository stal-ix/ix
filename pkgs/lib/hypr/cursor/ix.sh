{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprcursor/archive/refs/tags/v0.1.10.tar.gz
sha:67e845404164fee4c5694209b3d5f93a31b6963dbb0bfd6ed2cd96c99b316a08
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

{% block bld_tool %}
bld/prepend
{% endblock %}

{% block patch %}
prepend hyprcursor-util/src/main.cpp << EOF
#include <fstream>
EOF
prepend libhyprcursor/hyprcursor.cpp << EOF
#include <sstream>
EOF
{% endblock %}
