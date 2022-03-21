{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/lloyd/yajl/archive/refs/tags/2.1.0.tar.gz
6887e0ed7479d2549761a4d284d3ecb0
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libyajl_s.a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
