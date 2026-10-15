{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nwipe
{% endblock %}

{% block version %}
0.43
{% endblock %}

{% block fetch %}
https://github.com/martijnvanbrummelen/nwipe/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b1e9d94e1879934db688bce9515111ef6b0599b2244fdca2625a2e87e2d8e221
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/config
lib/kernel
lib/curses
lib/parted
lib/e2fsprogs
lib/device/mapper
lib/nvme
lib/shim/fake(lib_name=libconfig)
{% endblock %}
