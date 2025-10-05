{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/dlfcn
lib/amd/radv/driver/lib
{% endblock %}

{% block export_libs %}
libvulkan_radeon.a
{% endblock %}

{% block export_lib %}
_
{% endblock %}
