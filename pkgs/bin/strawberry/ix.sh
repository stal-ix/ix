{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strawberrymusicplayer/strawberry/archive/refs/tags/1.0.10.tar.gz
sha:66827d5ea19e17347e275667cf35566d94c0c502008e1ef8e0a0cc3724c798e1
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
    sed -e 's|STRAWBERRY_VERSION_DISPLAY|"1.0.10"|g' -i ${l}
done
{% endblock %}
