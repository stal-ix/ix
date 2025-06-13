{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
utf8proc
{% endblock %}

{% block version %}
2.10.0
{% endblock %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6f4f1b639daa6dca9f80bc5db1233e9cbaa31a67790887106160b33ef743f136
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/libutf8proc.pc
{% endblock %}
