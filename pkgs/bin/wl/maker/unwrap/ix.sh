{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/phkaeser/wlmaker
{% endblock %}

{% block git_commit %}
ed7a302fa78717ac496aeb2f2bd3256618f07d99
{% endblock %}

{% block git_sha %}
5627a0582b5d7e44849170ef94f77b1657caf5422ca78f44c570419f37e42237
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/cairo
lib/curses
lib/wayland
lib/wlroots/17
lib/xkb/common
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block patch %}
sed -e 's|1.22.90|1.22.0|g' -i CMakeLists.txt
cat << EOF >> third_party/protocols/CMakeLists.txt
set_target_properties(protocol_headers PROPERTIES LINKER_LANGUAGE CXX)
EOF
base64 -d << EOF > src/xdg_shell.c
{% include 'xdg_shell.c/base64' %}
EOF
find . -type f -name '*.c' | while read l; do
    sed -e 's|/usr/bin/foot|foot|' -i ${l}
done
find . -type f -name '*.h' | while read l; do
    sed -e 's|/usr/bin/foot|foot|' -i ${l}
done
{% endblock %}

{% block cmake_flags %}
CURSES_CURSES_LIBRARY=/
{% endblock %}
