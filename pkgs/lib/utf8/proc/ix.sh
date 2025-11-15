{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
utf8proc
{% endblock %}

{% block version %}
2.11.1
{% endblock %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
dc146fd279eacbbf399d3f70932ce66f516aac2d13f8ec2d26a30f8ed70aa5b4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/libutf8proc.pc
{% endblock %}
