{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://chromium.googlesource.com/libyuv/libyuv/+archive/51c6d12e7deeb790dc8a85d1c50a942caffa516c.tar.gz
sem:ced60cb3ddaac525eece8e26a170ca28
{% endblock %}

{% block lib_deps %}
lib/c
lib/jpeg
{% endblock %}

{% block unpack %}
mkdir src; cd src; extract0 ${src}/*gz
{% endblock %}

{% block patch %}
cat CMakeLists.txt \
    | grep -v ' SHARED ' \
    | grep -v '_shared'  \
    > _ && mv _ CMakeLists.txt
{% endblock %}
