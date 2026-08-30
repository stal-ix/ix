{% extends '//lib/placebo/6/ix.sh' %}

{% block pkg_name %}
libplacebo
{% endblock %}

{% block version %}
7.360.1
{% endblock %}

{% block fetch %}
https://code.videolan.org/videolan/libplacebo/-/archive/v{{self.version().strip()}}/libplacebo-v{{self.version().strip()}}.tar.bz2
937aa5eeea596798b3274d362de2e3bd32bc537a66d149dd85043349c74dffb6
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
