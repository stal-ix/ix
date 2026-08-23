{% extends '//die/c/make.sh' %}

{% block pkg_name %}
cpufetch
{% endblock %}

{% block version %}
1.07
{% endblock %}

{% block fetch %}
https://github.com/Dr-Noob/cpufetch/archive/refs/tags/v{{self.version().strip()}}.tar.gz
dc3ec8f9c9d41d8434702a778cc150b196d5d178fd768a964f57d22f268a2c17
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
