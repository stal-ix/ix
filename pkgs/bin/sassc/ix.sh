{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/sass/sassc/archive/refs/tags/3.6.2.tar.gz
md5:4c3b06ce2979f2a9f0a35093e501d8bb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/sass
{% endblock %}
