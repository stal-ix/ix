{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/magiblot/tvision/archive/c5522641b108a4d33a2004b0fac6d9a34daac2a3.zip
sha:5a2e62ede30882428673b2c6c849a75bb237d264518288f85f3d28bfab008f2e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/kernel
lib/curses
{% endblock %}
