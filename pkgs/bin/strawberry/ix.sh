{% extends '//die/c/cmake.sh' %}

{% block version %}1.0.18{% endblock %}

{% block fetch %}
https://github.com/strawberrymusicplayer/strawberry/archive/refs/tags/{{self.version()}}.tar.gz
sha:1c16e589d653904605468089e18c6b1b7cef3bfa803ee1c7d5a0e35e4e57a680
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/tag
lib/dbus
lib/glib
lib/alsa
lib/boost
lib/gnutls
lib/protoc
lib/sqlite/3
lib/gstreamer
lib/qt/6/base
lib/qt/6/deps
lib/tag/parser
{% endblock %}

{% block bld_tool %}
bld/glib
bld/qt/6
bin/protoc
bld/qt/6/tools
{% endblock %}

{% block patch %}
sed -e 's|.*FATAL.*Protobuf.*||' -i CMakeLists.txt
find . -type f -name '*.cpp' | while read l; do
    sed -e 's|STRAWBERRY_VERSION_DISPLAY|"{{self.version()}}"|g' -i ${l}
done
{% endblock %}

{% block cmake_flags %}
protobuf_PROTOC_EXE="${PROTOC_EXE}"
{% endblock %}
