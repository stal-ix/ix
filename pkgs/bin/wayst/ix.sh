{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/91861/wayst
{% endblock %}

{% block git_commit %}
f8b218eec1af706fd5ae287f5073e6422eb8b6d8
{% endblock %}

{% block git_sha %}
1bdbf4bf5e1acaee6a94a982ce47802340000109db3412df06e0f4cb5d0fe72e
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
