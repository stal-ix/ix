{% extends '//die/c/cmake.sh' %}

{% set version %}1.4{% endset %}

{% block fetch %}
https://github.com/xiph/opus/archive/refs/tags/v{{version}}.tar.gz
sha:659e6b223e42a51b0a898632b9a5f406ccd5c2e00aa526ddd1264789774b94e5
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block patch %}
>opus_buildtype.cmake
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Version:.*|Version: {{version}}|' -i ${out}/lib/pkgconfig/opus.pc
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/opus \${CPPFLAGS}"
{% endblock %}
