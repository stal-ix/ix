{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/libusb/libusb/releases/download/v1.0.24/libusb-1.0.24.tar.bz2
sha:7efd2685f7b327326dcfb85cee426d9b871fd70e22caa15bb68d595ce2a2b12a
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}
