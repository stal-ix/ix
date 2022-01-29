{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v1.6.35.tar.gz
d703ed4913fcfb40021bd3d4d35e00b6
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}
