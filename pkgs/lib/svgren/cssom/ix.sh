{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
cssom
{% endblock %}

{% block version %}
0.2.24
{% endblock %}

{% block fetch %}
https://github.com/cppfw/cssom/archive/refs/tags/{{self.version().strip()}}.tar.gz
33dac081fc2e4bffa943db92fbaf440d984d905d446e8cd991277ae15ff9a415
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/utki
lib/svgren/fsif
{% endblock %}
