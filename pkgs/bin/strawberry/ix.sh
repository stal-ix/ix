{% extends '//die/c/cmake.sh' %}

{% block version %}1.0.23{% endblock %}

{% block fetch %}
https://github.com/strawberrymusicplayer/strawberry/archive/refs/tags/{{self.version()}}.tar.gz
sha:fdc4b7e6354d79f39065cf43c1f595d2df8c91ebe2ba5959994742e1e38f3113
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
lib/kd/single/application
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
