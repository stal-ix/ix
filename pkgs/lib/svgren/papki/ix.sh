{% extends '//lib/svgren/t/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/papki/archive/refs/tags/1.0.134.tar.gz
sha:12604fede195d101b2ca1ed50c88c424b686b54bc92a0bbe7bd7c2993f4ce29c
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/svgren/utki
{% endblock %}
