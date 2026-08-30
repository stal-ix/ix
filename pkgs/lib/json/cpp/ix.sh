{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
jsoncpp
{% endblock %}

{% block version %}
1.9.8
{% endblock %}

{% block fetch %}
https://github.com/open-source-parsers/jsoncpp/archive/refs/tags/{{self.version().strip()}}.tar.gz
51828cf3574281d2b79ec2a1c56a9e4c20cc1103711321ea96384cffb8d2d904
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
