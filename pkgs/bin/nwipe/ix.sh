{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/martijnvanbrummelen/nwipe/archive/refs/tags/v0.35.tar.gz
sha:fbafa2f7b6dce31bde628399b177e99894cb8ec4c24a1c41cef2d42df7185504
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
