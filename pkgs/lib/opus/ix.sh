{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
opus
{% endblock %}

{% block version %}
1.5.2
{% endblock %}

{% block fetch %}
https://github.com/xiph/opus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:9480e329e989f70d69886ded470c7f8cfe6c0667cc4196d4837ac9e668fb7404
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
