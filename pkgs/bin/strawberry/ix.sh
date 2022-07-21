{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strawberrymusicplayer/strawberry/archive/refs/tags/1.0.6.tar.gz
sha:81e7cd27f196e106269b99ca8e2105f7b3cd2331b4e66bb6effc4f7dfbf15620
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
