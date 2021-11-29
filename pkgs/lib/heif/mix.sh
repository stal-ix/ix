{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.12.0.tar.gz
2501e9226858a917691c4181e6f784b3
{% endblock %}

{% block lib_deps %}
lib/x265/mix.sh
lib/de265/mix.sh
{% endblock %}
