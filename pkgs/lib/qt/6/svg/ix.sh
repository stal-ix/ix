{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v6.4.1.tar.gz
sha:be6300292a6f38d85c13bb750890af268bd979fb18ab754f88d5332935215e47
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
