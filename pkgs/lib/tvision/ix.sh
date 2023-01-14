{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/magiblot/tvision/archive/0decd5baf3700df39fecef5d3c450c92dda3b216.zip
sha:1985df0062cbd9f68108bfec9bb6d06a862f333caf35bf0fa7ac5e711cb957ef
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/kernel
lib/curses
{% endblock %}
