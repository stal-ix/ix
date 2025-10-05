{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/dlfcn
lib/intel/anv/driver/lib
{% endblock %}

{% block export_libs %}
libvulkan_intel.a
{% endblock %}

{% block export_lib %}
_
{% endblock %}
