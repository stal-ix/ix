{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/easymodo/qimgv/archive/refs/tags/v1.0.2.tar.gz
sha:ace75077c5b6f3cb2b0d40b24482b3778728d98dce75ed8186c7ae4282e57634
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/opencv
lib/qt/6/svg
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/compat
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}

{% block cmake_flags %}
# exiv2 segfaults
EXIV2=OFF
VIDEO_SUPPORT=OFF
{% endblock %}
