{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
volk
{% endblock %}

{% block version %}
1.4.313.0
{% endblock %}

{% block fetch %}
https://github.com/zeux/volk/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
d86bcf1aff499f41a3e445b55df5e393a5ce49b1bda689eb7335b0a0a54a3c0b
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
