{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/v1.2.201.tar.gz
bb83fbcd393bfa6f3b83d2ce7ce987ed

#ed5310a472c275bd47ed3f6129b125a0
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
{% endblock %}
