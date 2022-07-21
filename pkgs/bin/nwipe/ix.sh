{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/martijnvanbrummelen/nwipe/archive/refs/tags/v0.34.tar.gz
sha:6cdd67425d4dc2be95792b072b49d773ce017dca0e7a9692f0a114fce3aeb0ed
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/curses
lib/parted
lib/e2fsprogs
lib/device/mapper
{% endblock %}
