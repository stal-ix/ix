{% extends '//die/c/cmake.sh' %}

{% block version %}1.1.2{% endblock %}

{% block fetch %}
https://github.com/strawberrymusicplayer/strawberry/archive/refs/tags/{{self.version()}}.tar.gz
sha:53c98ae680166fb406feadc4717c474aa11ec10334b875ae6e83fdd67f11d1a2
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
lib/gstreamer/dl
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
