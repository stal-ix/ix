{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/easymodo/qimgv
{% endblock %}

{% block git_commit %}
c913500832f735a271f5880527738ec4e584b15b
{% endblock %}

{% block git_sha %}
7af96d5201690e3826921af297057774e469ab9073c59d17dc13cc8d9c9fcc2e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/exiv2
lib/opencv
lib/qt/6/svg
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/compat
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cmake_flags %}
VIDEO_SUPPORT=OFF
{% endblock %}

{% block patch %}
sed -e 's|image = Exiv2::ImageFactory::open(toStdString(fileInfo.filePath()))|image.reset(Exiv2::ImageFactory::open(toStdString(fileInfo.filePath())).release())|' \
    -i qimgv/sourcecontainers/documentinfo.cpp
{% endblock %}
