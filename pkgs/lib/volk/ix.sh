{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
volk
{% endblock %}

{% block version %}
1.4.328.1
{% endblock %}

{% block fetch %}
https://github.com/zeux/volk/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
8d6a4092d5de62d0c6290394cf81cf7a99e36875934b1b75d595e76d08fcadd1
{% endblock %}

{% block lib_deps %}
lib/c
lib/vulkan/headers
{% endblock %}

{% block cmake_flags %}
VOLK_INSTALL=ON
{% endblock %}

{% block patch %}
(
echo '#pragma once'

cat volk.h | grep extern | grep PFN | sed -e 's|extern ||' | sed -e 's| .*||' | sed -e 's|PFN_||' | sort | uniq | while read l; do
    echo "#define ${l} volk_${l}"
done

cat volk.h
) > _

mv _ volk.h
{% endblock %}
