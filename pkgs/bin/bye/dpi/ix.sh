{% extends '//die/c/make.sh' %}

{% block pkg_name %}
byedpi
{% endblock %}

{% block version %}
0.17
{% endblock %}

{% block fetch %}
https://github.com/hufrea/byedpi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
06a325e47eb10b7183d6d56381c2df5bf56ba9efbed003eae0344a7e6694315b
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
