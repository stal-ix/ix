{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
svgdom
{% endblock %}

{% block version %}
0.4.11
{% endblock %}

{% block fetch %}
https://github.com/cppfw/svgdom/archive/refs/tags/{{self.version().strip()}}.tar.gz
47b8040c1182017669dc72f9a97849f3aa2c0238c3bd09724a5a5b3d27351752
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/r4
lib/svgren/cssom
lib/svgren/mikroxml
{% endblock %}
