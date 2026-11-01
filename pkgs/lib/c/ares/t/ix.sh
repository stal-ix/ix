{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
c-ares
{% endblock %}

{% block version %}
1.34.9
{% endblock %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/v{{self.version().strip()}}.tar.gz
453bab9eb8c2bd4343b527dd97dbd77e1fab6608781dda2dbbfde7e480882c97
{% endblock %}

{% block lib_deps %}
lib/c
{% if mingw32 %}
lib/shim/dll(dll_name=iphlpapi)
{% endif %}
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block cmake_flags %}
CARES_STATIC=ON
CARES_SHARED=OFF
{% endblock %}
