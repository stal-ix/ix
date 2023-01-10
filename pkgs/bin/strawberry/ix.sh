{% extends '//die/c/cmake.sh' %}

{% block version %}1.0.13{% endblock %}

{% block fetch %}
https://github.com/strawberrymusicplayer/strawberry/archive/refs/tags/{{self.version()}}.tar.gz
sha:95a3765a98e75cccb4fd04660be0ecd2965d8ad731e5dacc115687c22cec58cb
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
lib/sqlite/3
lib/protobuf
lib/gstreamer
lib/qt/6/base
lib/qt/6/deps
lib/tag/parser
{% endblock %}

{% block bld_tool %}
bld/qt/6
bin/protoc
bld/qt/6/tools
bld/glib
{% endblock %}

{% block patch %}
find . -type f -name '*.cpp' | while read l; do
    sed -e 's|STRAWBERRY_VERSION_DISPLAY|"{{self.version()}}"|g' -i ${l}
done
{% endblock %}
