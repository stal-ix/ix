{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v2.10.0.tar.gz
sha:6f4f1b639daa6dca9f80bc5db1233e9cbaa31a67790887106160b33ef743f136
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/libutf8proc.pc
{% endblock %}
