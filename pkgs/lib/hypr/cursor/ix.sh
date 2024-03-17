{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprcursor/archive/refs/tags/v0.1.4.tar.gz
sha:082c7866a8139993be0c476873dafea357bb579c8d1839280be6bfdef3177193
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/zip
lib/cairo
lib/hypr/lang
{% endblock %}

{% block bld_libs %}
lib/hypr/rsvg
{% endblock %}

{% block patch %}
sed -e 's|DATA->data + DATA->readNeedle|(char*)DATA->data + DATA->readNeedle|' -i libhyprcursor/hyprcursor.cpp
sed -e 's|.*target.*std=.*||' -i CMakeLists.txt
{% endblock %}
