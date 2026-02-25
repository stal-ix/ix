{% extends '//lib/placebo/6/ix.sh' %}

{% block pkg_name %}
libplacebo
{% endblock %}

{% block version %}
7.360.0
{% endblock %}

{% block fetch %}
https://code.videolan.org/videolan/libplacebo/-/archive/v{{self.version().strip()}}/libplacebo-v{{self.version().strip()}}.tar.bz2
265a8888d4bc169b39c53315f1ba682249f2b0917e0438c1bb241aef822d8744
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
