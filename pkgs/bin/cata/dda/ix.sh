{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/CleverRaven/Cataclysm-DDA
{% endblock %}

{% block git_branch %}
0.H-RELEASE
{% endblock %}

{% block git_commit %}
08f04fd07f028219a65f2f1fc8e73719dc9c954e
{% endblock %}

{% block git_sha %}
339d3b90d90fe4be0c3d1697cdede97e6bbaa736d439f751c777845e5d0789c9
{% endblock %}

{% block pkg_name %}
cataclysm-dda
{% endblock %}

{% block version %}
0.H
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/z
lib/kernel
lib/ncurses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
# bypass cmake curses detection — wrap_cc already provides paths
sed -i 's|find_package(Curses)|set(CURSES_FOUND TRUE)\nset(CURSES_LIBRARIES ncursesw)\nset(CURSES_INCLUDE_DIRS "")|' CMakeLists.txt
# fix const assignment in bundled flatbuffers (clang 21)
sed -i 's|const size_type count_;|size_type count_;|' src/third-party/flatbuffers/stl_emulation.h
# cmake install expects VERSION.txt
echo "0.H" > VERSION.txt
{% endblock %}

{% block cmake_flags %}
CURSES=ON
TILES=OFF
SOUND=OFF
BACKTRACE=OFF
TESTS=OFF
LOCALIZE=OFF
{% endblock %}
