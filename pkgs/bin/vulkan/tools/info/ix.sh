{% extends '//bin/vulkan/tools/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/build/muldefs
{% endblock %}

{% block cmake_flags %}
{{super()}}
BUILD_CUBE=OFF
{% endblock %}
