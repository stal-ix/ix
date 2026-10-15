{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
fsif
{% endblock %}

{% block version %}
1.0.161
{% endblock %}

{% block fetch %}
https://github.com/cppfw/fsif/archive/refs/tags/{{self.version().strip()}}.tar.gz
92a9dccc483f8f41edc4c448f3316f11d56059f8f2448455476e9ddd4e8098c2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/svgren/utki
{% endblock %}
