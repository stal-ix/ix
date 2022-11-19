{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/magiblot/tvision/archive/c5522641b108a4d33a2004b0fac6d9a34daac2a3.zip
#sha:5a2e62ede30882428673b2c6c849a75bb237d264518288f85f3d28bfab008f2e
https://github.com/magiblot/tvision/archive/0decd5baf3700df39fecef5d3c450c92dda3b216.zip
sha:1985df0062cbd9f68108bfec9bb6d06a862f333caf35bf0fa7ac5e711cb957ef
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/kernel
lib/curses
{% endblock %}
