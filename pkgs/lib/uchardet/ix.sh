{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/freedesktop/uchardet/archive/refs/tags/v0.0.7.tar.gz
sha:561db71ffe3b090da48cd17f441bb7976694db55edd9cc16a6bd6ffcb9e66e8f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
