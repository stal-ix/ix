{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nwipe
{% endblock %}

{% block version %}
0.39
{% endblock %}

{% block fetch %}
https://github.com/martijnvanbrummelen/nwipe/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1038386b0c745ce418a43bf09ecf3a4ff17072961f4a3be0e940dfa45b10e9e4
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
