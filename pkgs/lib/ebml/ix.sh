{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Matroska-Org/libebml/archive/refs/tags/release-1.4.2.tar.gz
sha:66486742fd4f443553ad1917505208404c8c4240c0ab26cedaf41d9476efc665
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
