{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
volk
{% endblock %}

{% block version %}
1.4.363.0
{% endblock %}

{% block fetch %}
https://github.com/zeux/volk/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
1547d8d74395d4048fb3f4a6313da56db626e89b55db238d0d7e8944c8a645f3
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
