{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
opus
{% endblock %}

{% block version %}
1.6.1
{% endblock %}

{% block fetch %}
https://github.com/xiph/opus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bf0b97ec7a65890b8db90ef94c4d6c18de12584c3085031953a10986f5917745
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
