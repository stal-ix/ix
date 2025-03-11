{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfloat/fast_float/archive/refs/tags/v8.0.1.tar.gz
sha:18f868f0117b359351f2886be669ce9cda9ea281e6bf0bcc020226c981cc3280
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
