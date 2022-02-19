{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/google/googletest/archive/refs/tags/release-1.11.0.tar.gz
sha:b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
