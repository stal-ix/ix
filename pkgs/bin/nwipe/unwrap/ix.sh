{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nwipe
{% endblock %}

{% block version %}
0.43.1
{% endblock %}

{% block fetch %}
https://github.com/martijnvanbrummelen/nwipe/archive/refs/tags/v{{self.version().strip()}}.tar.gz
134169dc2b0e11c1d3d6ea9c3d03b2dd0a69151cfb612e39ab17a81fd64eb02f
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
