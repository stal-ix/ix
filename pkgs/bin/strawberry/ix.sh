{% extends '//die/c/cmake.sh' %}

{% block version %}1.0.17{% endblock %}

{% block fetch %}
https://github.com/strawberrymusicplayer/strawberry/archive/refs/tags/{{self.version()}}.tar.gz
sha:45c980264443ec1d596e0a38a8c83a93083ecfafc485d61b8f7bc9d92667ad79
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
bld/glib
bld/qt/6
bin/protoc
bld/qt/6/tools
{% endblock %}

{% block patch %}
find . -type f -name '*.cpp' | while read l; do
    sed -e 's|STRAWBERRY_VERSION_DISPLAY|"{{self.version()}}"|g' -i ${l}
done
{% endblock %}
