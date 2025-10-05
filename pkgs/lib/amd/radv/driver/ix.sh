{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/drm
lib/wayland
lib/elfutils
lib/amd/radv/driver/dl
lib/amd/radv/driver/lib
lib/amd/radv/driver/allsym
{% endblock %}
