{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/CleverRaven/Cataclysm-DDA
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
9814027aa75ef6412d60147a545f0b0910e436661cf8f5735768b340ae85cb31
{% endblock %}

{% block pkg_name %}
cataclysm-dda
{% endblock %}

{% block version %}
0.I-1
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
# data/help is listed, but not shipped
sed -i 's|^ *help)$|)|' data/CMakeLists.txt
# no git to describe the version
echo '#define VERSION "{{self.version().strip()}}"' > src/version.h
# cmake install expects VERSION.txt
echo "{{self.version().strip()}}" > VERSION.txt
{% endblock %}

{% block cmake_flags %}
CURSES=ON
TILES=OFF
SOUND=OFF
BACKTRACE=OFF
TESTS=OFF
LOCALIZE=OFF
{% endblock %}
