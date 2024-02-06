{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.31.0.tar.gz
sha:d1fa72c9d16eedec43ba99de9f1ad511c8246cbe4e70dd1f9d865ef72984829d
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
lib/dbus
lib/python
lib/lcms/2
lib/opengl
lib/xxhash
lib/harfbuzz
lib/xkb/common
lib/fontconfig
{% endblock %}

{% block bld_libs %}
pip/setuptools
lib/shim/fake/pkg(pkg_name=gl,pkg_ver=4.6.0)
{% endblock %}

{% block bld_tool %}
bld/make
bld/wayland
bld/pkg/config
bld/python/{{python_ver}}
{% endblock %}

{% block build %}
${NATIVE_PYTHON} setup.py build
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-fno-lto ${CFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|x11 wayland|wayland|' -i setup.py
sed -e 's|build_static_kit.*args.*|pass|' -e 's|kitten_exe = pass|pass|' -i setup.py
{% endblock %}
