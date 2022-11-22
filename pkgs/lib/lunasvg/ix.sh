{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/sammycage/lunasvg/archive/refs/tags/v2.3.5.tar.gz
sha:350ff56aa1acdedefe2ad8a4241a9fb8f9b232868adc7bd36dfb3dbdd57e2e93
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
