{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/91861/wayst/archive/633d2a3c62e6ae1e074cb542158e62c5a3c4cc61.zip
sha:9f3f0b3410b5d3d64aa9dda348aac61e3245245b3239a74a8b483ded1586f890
{% endblock %}

{% block bld_libs %}
lib/c
lib/opengl
lib/wayland
lib/freetype
lib/utf8/proc
lib/xkbcommon
lib/fontconfig
lib/drivers/3d
lib/shim/fake(lib_name=GL)
{% endblock %}

{% block make_flags %}
INSTALL_DIR=${out}/bin
window_protocol=wayland
{% endblock %}

{% block install %}
mkdir ${out}/bin
{{super()}}
{% endblock %}
