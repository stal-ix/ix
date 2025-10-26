{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ngtcp2
{% endblock %}

{% block version %}
1.17.0
{% endblock %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6bc477ff47eb62c9be2edd84c58662b180a66c9e9ee546308c65565a6146216f
{% endblock %}

{% block lib_deps %}
lib/c
lib/ev
lib/ng/http/3
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_LIB=OFF
ENABLE_SHARED_LIB=ON
{% endblock %}

{% block patch %}
{{super()}}
>examples/CMakeLists.txt
>third-party/CMakeLists.txt
{% endblock %}

{% block bld_tool %}
{% if darwin %}
bld/fake(tool_name=install_name_tool)
{% endif %}
{% endblock %}

{% block env %}
export COFLAGS="--with-ngtcp2=${out} \${COFLAGS}"
{% endblock %}
