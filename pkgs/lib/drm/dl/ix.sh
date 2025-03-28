{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/drm
{% endblock %}

{% block export_libs %}
libdrm.a
{% endblock %}

{% block export_lib %}
drm
{% endblock %}
