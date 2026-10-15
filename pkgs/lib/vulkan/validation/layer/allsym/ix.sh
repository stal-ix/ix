{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/dlfcn
lib/vulkan/validation/layer/lib
{% endblock %}

{% block export_libs %}
libvvl.a
{% endblock %}

{% block export_lib %}
_
{% endblock %}
