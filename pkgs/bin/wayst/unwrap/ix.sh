{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/91861/wayst
{% endblock %}

{% block git_commit %}
f8b218eec1af706fd5ae287f5073e6422eb8b6d8
{% endblock %}

{% block git_sha %}
0d9bf560e9d35e718aa28ee34908fcfd46f5e4fcbb4fb6ec99eb4c5a1edf2de0
{% endblock %}

{% block bld_libs %}
lib/c
lib/opengl
lib/wayland
lib/freetype
lib/utf8/proc
lib/xkb/common
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
