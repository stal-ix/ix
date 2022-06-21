{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/tenacityteam/libmad/archive/refs/tags/0.16.1.tar.gz
sha:3b716425cfab52d4c5127f45675a784f5c15d21b61d55850a49b2152c1bb108d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
