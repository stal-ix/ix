{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v2.7.0.tar.gz
11e307064ed630f6a99d825608a248e4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib/pkgconfig
cat libutf8proc.pc | grep -v exec_prefix > _ && mv _ libutf8proc.pc
{% endblock %}
