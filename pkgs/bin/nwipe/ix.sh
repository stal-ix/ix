{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/martijnvanbrummelen/nwipe/archive/refs/tags/v0.35.tar.gz
sha:323e79a4861f96aed75369a5b9048791a8aca1e72c9d8e1c87531346cba6a7ab
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
