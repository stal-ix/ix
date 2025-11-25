{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
utf8proc
{% endblock %}

{% block version %}
2.11.2
{% endblock %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a9b8d8fd57fb3aeca2aede62fd58958036d3bd29871afc1b871e3916c48420a7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/libutf8proc.pc
{% endblock %}
