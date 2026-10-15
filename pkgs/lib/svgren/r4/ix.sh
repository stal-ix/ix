{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
r4
{% endblock %}

{% block version %}
1.0.112
{% endblock %}

{% block fetch %}
https://github.com/cppfw/r4/archive/refs/tags/{{self.version().strip()}}.tar.gz
44123d99512f4a7fbf1b7bde8803c9a23732b2c477a083b97741192a95e17b55
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/utki
{% endblock %}
