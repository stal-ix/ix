{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nwipe
{% endblock %}

{% block version %}
0.42
{% endblock %}

{% block fetch %}
https://github.com/martijnvanbrummelen/nwipe/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0e38474495cc6c86043a1de0460cf0dc009ad68e079ee23d71569e80e55cd2e6
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
lib/shim/fake(lib_name=libconfig)
{% endblock %}
