{% extends '//die/c/make.sh' %}

{% block pkg_name %}
byedpi
{% endblock %}

{% block version %}
0.17.1
{% endblock %}

{% block fetch %}
https://github.com/hufrea/byedpi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f681d8f141da73ecae0fbae5db0730a3cd297a44efa38e8227b3bbbc3ced9d9b
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
