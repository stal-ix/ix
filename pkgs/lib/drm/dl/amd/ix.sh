{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/drm
{% endblock %}

{% block export_libs %}
libdrm_amdgpu.a
{% endblock %}

{% block export_lib %}
drm_amdgpu
{% endblock %}
