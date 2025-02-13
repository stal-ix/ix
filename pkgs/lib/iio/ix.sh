{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/analogdevicesinc/libiio/archive/refs/tags/v0.26.tar.gz
sha:fb445fb860ef1248759f45d4273a4eff360534480ec87af64c6b8db3b99be7e5
{% endblock %}

{% block lib_deps %}
lib/c
lib/usb
lib/aio
lib/xml/2
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block cmake_flags %}
HAVE_DNS_SD=OFF
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
