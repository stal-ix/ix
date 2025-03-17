{% extends '//die/c/gn.sh' %}

{% block fetch %}
https://commondatastorage.googleapis.com/chromium-browser-official/chromium-115.0.5790.90.tar.xz
sha:82e802bcd2ae8d575d7fda9ec82db83d04d5453e9304cb482644f629232bd394
{% endblock %}

{% block task_pool %}full{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block step_unpack %}
{{super()}}
cd third_party/angle
{% endblock %}

{% block gn_args %}
angle_enable_vulkan=true
angle_use_wayland=true
{% endblock %}

{% block ninja_build_targets %}
libEGL.so
{% endblock %}
