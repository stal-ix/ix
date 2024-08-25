{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/zeux/volk/archive/refs/tags/vulkan-sdk-1.3.290.0.tar.gz
sha:bb6a6d616c0f2bbd5d180da982a6d92a0948581cec937de69f17883980c6ca06
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
