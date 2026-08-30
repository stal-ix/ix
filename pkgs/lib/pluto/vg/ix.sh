{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
plutovg
{% endblock %}

{% block version %}
1.3.3
{% endblock %}

{% block fetch %}
https://github.com/sammycage/plutovg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2b0d17a6e016f47b86f9c00e2cb82600041b1ea1f7d2a00c2d46ae542cbfed3c
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/plutovg \${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
sed -i 's| -pthread||g' ${out}/lib/pkgconfig/plutovg.pc
{% endblock %}
