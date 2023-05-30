{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/sammycage/lunasvg/archive/refs/tags/v2.3.8.tar.gz
sha:54d697e271a5aca36f9999d546b1b346e98a8183140027330f69a3eb0c184194
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
