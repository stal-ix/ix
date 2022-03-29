{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/sdk-1.3.204.1.tar.gz
sha:c520156f1927c2c3909094f414fc0c68996aaf9809dc5ef1b22a520b762fe9a7

#https://github.com/KhronosGroup/glslang/archive/refs/tags/11.7.1.tar.gz
#0855c7b65da1e9be5ff89eeddeda691a
{% endblock %}

{% block bld_tool %}
bld/python
bin/bison/3/8
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block patch %}
sed -e 's|.*add_link_options.*||' -i CMakeLists.txt
{% endblock %}
