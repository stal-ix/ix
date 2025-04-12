{% extends '//die/c/cmake.sh' %}

{% block version %}
3.12.3
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:d0af071f2f4187d8b26b556e83ef832b634bd5feb4e2f537b9dabbd334d4e334
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
