{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/91861/wayst
{% endblock %}

{% block git_commit %}
f8b218eec1af706fd5ae287f5073e6422eb8b6d8
{% endblock %}

{% block git_sha %}
0c85cfa391e8bd8101875b51d923df9e7c9fe6d94349889252f544a9b5d9a34b
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

{% block git_version %}
v3
{% endblock %}
