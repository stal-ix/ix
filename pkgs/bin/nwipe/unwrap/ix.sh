{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/martijnvanbrummelen/nwipe/archive/refs/tags/v0.37.tar.gz
sha:f35ed567f3d4f36ed14e0d0153166acac519238f2ff186b06b501b2d8ad86585
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
