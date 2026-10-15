{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
rasterimage
{% endblock %}

{% block version %}
0.1.40
{% endblock %}

{% block fetch %}
https://github.com/cppfw/rasterimage/archive/refs/tags/{{self.version().strip()}}.tar.gz
8ec2f5ed5c0e10b2dfad7ae8aafef27087d2d503e0690cfd03b8be90bd0275e2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/png
lib/jpeg
lib/svgren/r4
lib/svgren/fsif
{% endblock %}
