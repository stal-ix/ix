{% extends '//die/c/make.sh' %}

{% block pkg_name %}
byedpi
{% endblock %}

{% block version %}
0.17.2
{% endblock %}

{% block fetch %}
https://github.com/hufrea/byedpi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8dcf0d1618b2ef46a5854ce6448ad1bc46857f94b876a4b8efa52e28a18da2a8
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
