{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v2.8.0.tar.gz
sha:a0a60a79fe6f6d54e7d411facbfcc867a6e198608f2cd992490e46f04b1bcecc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/libutf8proc.pc
{% endblock %}
