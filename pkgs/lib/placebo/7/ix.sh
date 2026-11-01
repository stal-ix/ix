{% extends '//lib/placebo/6/ix.sh' %}

{% block pkg_name %}
libplacebo
{% endblock %}

{% block version %}
7.387.0
{% endblock %}

{% block fetch %}
https://code.videolan.org/videolan/libplacebo/-/archive/v{{self.version().strip()}}/libplacebo-v{{self.version().strip()}}.tar.bz2
14ceeeb14d1c08fcdb1a782a06129da11f842c6fddbf3a43c1c4061406ad03d2
{% endblock %}

{% block meson_flags %}
{{super()}}
demos=false
unwind=disabled
{% if vulkan %}
vk-proc-addr=disabled
{% endif %}
gl-proc-addr=disabled
{% endblock %}
