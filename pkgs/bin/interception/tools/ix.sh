{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/interception/linux/tools/-/archive/v0.6.8/tools-v0.6.8.tar.bz2
sha:45527d9430c2d29f9dce9403d2f8d76f393fe156c8736d618166388169d4268d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/udev
lib/evdev
lib/boost
lib/linux
lib/yaml/cpp
{% endblock %}
