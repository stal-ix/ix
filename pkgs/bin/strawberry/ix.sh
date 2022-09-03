{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strawberrymusicplayer/strawberry/archive/refs/tags/1.0.9.tar.gz
sha:f442d41f795765745db4a4f1dc101fc8dd5c09aa2c55bc94f64e0f43b2f7e2f9
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
bld/glib/codegen
{% endblock %}

{% block patch %}
find . -type f -name '*.cpp' | while read l; do
    sed -e 's|STRAWBERRY_VERSION_DISPLAY|"1.0.5"|g' -i ${l}
done
{% endblock %}
