{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
utf8proc
{% endblock %}

{% block version %}
2.12.0
{% endblock %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f564011d38b2888d583d510b08e69ffa15aa117155db1b9b49ef1dfe1fa25111
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/libutf8proc.pc
{% endblock %}
