{% extends '//lib/svgren/t/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/svgdom/archive/refs/tags/0.4.2.tar.gz
sha:f760445503ab1ff828e5014c6f9cf8c5c3d501dc850b12619e8d2fd66cfe90a6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/r4
lib/svgren/cssom
lib/svgren/mikroxml
{% endblock %}
