{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
veg
{% endblock %}

{% block version %}
0.1.14
{% endblock %}

{% block fetch %}
https://github.com/cppfw/veg/archive/refs/tags/{{self.version().strip()}}.tar.gz
d8ee65d88ed7270d0e16d806fa94dda09c26b07aec4643de5a6cbd06986c93c8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/r4
lib/svgren/agg
lib/svgren/utki
lib/svgren/rasterimage
{% endblock %}
