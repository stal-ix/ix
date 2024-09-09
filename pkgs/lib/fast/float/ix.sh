{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfloat/fast_float/archive/refs/tags/v6.1.6.tar.gz
sha:4458aae4b0eb55717968edda42987cabf5f7fc737aee8fede87a70035dba9ab0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
