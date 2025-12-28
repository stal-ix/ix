{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
opus
{% endblock %}

{% block version %}
1.6
{% endblock %}

{% block fetch %}
https://github.com/xiph/opus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a9f9f04196174e4a1bdb5e0c5a85e36ebbd45a18cbbbb8be5024c59b3c001964
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block patch %}
>opus_buildtype.cmake
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Version:.*|Version: {{self.version().strip()}}|' -i ${out}/lib/pkgconfig/opus.pc
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/opus \${CPPFLAGS}"
{% endblock %}
