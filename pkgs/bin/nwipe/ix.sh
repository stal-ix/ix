{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/martijnvanbrummelen/nwipe/archive/refs/tags/v0.34.tar.gz
sha:be3122fcd8a6c8099ee1ae37dd640848774fdb84a7045a7b33dcf54c1ec69c29
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/curses
lib/parted
lib/e2fsprogs
lib/device/mapper
{% endblock %}
