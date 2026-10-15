{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
mikroxml
{% endblock %}

{% block version %}
0.1.75
{% endblock %}

{% block fetch %}
https://github.com/cppfw/mikroxml/archive/refs/tags/{{self.version().strip()}}.tar.gz
d68d66235c3fa3020f5da367c27352d0e159d5117a19a2cb50757f0f5fc63e1e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/utki
{% endblock %}
