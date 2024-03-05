{% extends '//die/c/cmake.sh' %}

{% block version %}
1.5.1
{% endblock %}

{% block fetch %}
https://github.com/xiph/opus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:7ce44ef3d335a3268f26be7d53bb3bed7205b34eaf80bf92a99e69d490afe9d9
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
