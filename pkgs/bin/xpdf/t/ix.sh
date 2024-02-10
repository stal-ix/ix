{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://dl.xpdfreader.com/xpdf-4.05.tar.gz
sha:92707ed5acb6584fbd73f34091fda91365654ded1f31ba72f0970022cf2a5cea
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/png
lib/paper
lib/freetype
{% endblock %}
