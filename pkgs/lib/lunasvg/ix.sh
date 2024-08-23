{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/sammycage/lunasvg/archive/refs/tags/v2.4.1.tar.gz
sha:db9d2134c8c2545694e71e62fb0772a7d089fe53e1ace1e08c2279a89e450534
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
