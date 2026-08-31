{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
volk
{% endblock %}

{% block version %}
1.4.357.0
{% endblock %}

{% block fetch %}
https://github.com/zeux/volk/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
6400c7b23e24d17e4f04bac49b55b06c4e87677d33398e90344743ec73560ca6
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
