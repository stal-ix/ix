{% extends '//lib/svgren/t/ix.sh' %}

{% block version %}
0.1.8
{% endblock %}

{% block fetch %}
https://github.com/cppfw/rasterimage/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:7a3e06498ccd68d555735d45cdf4c8f3cd88074341085b3a11f85d4acfc5827d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/png
lib/jpeg
lib/svgren/r4
lib/svgren/papki
{% endblock %}
