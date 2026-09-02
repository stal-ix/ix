{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
papki
{% endblock %}

{% block version %}
1.0.134
{% endblock %}

{% block fetch %}
https://github.com/cppfw/papki/archive/97395b82577b9ceb458d95c5ea5687e572cb948b.tar.gz
86d1ea779b9422b040e108a1530b81e2e4e9bbd64f04c202781346e063c4d1cd
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/svgren/utki
{% endblock %}
