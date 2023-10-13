{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.6.0.tar.gz
sha:527ba6480489317f798f9ab3f858b71753fb80de3d7d715368a12d4e76ea704c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/xkb/common
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
