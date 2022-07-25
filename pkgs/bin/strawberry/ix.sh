{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strawberrymusicplayer/strawberry/archive/refs/tags/1.0.7.tar.gz
sha:d3807dca3df039299122541f4d29a474a3698736b20226b3b2db15821d981415
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
