{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v18.1.3.tar.gz
sha:d896f35102c3ba9e16ead7b4db53b75e6131982cdb36a3324f17c68a43598759
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/llvm/18
lib/vulkan/spirv/tools
{% endblock %}

