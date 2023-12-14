{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Matroska-Org/libebml/archive/refs/tags/release-1.4.5.tar.gz
sha:86c99573cd0957884f26547d1a8fa0c979e4d6d57484dfd387345846e6720f49
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
