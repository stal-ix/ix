{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
utf8proc
{% endblock %}

{% block version %}
2.11.3
{% endblock %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
abfed50b6d4da51345713661370290f4f4747263ee73dc90356299dfc7990c78
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/libutf8proc.pc
{% endblock %}
