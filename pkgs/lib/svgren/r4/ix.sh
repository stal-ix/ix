{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
r4
{% endblock %}

{% block version %}
1.0.77
{% endblock %}

{% block fetch %}
https://github.com/cppfw/r4/archive/refs/tags/{{self.version().strip()}}.tar.gz
f80543e2519a22c25a453b2e5450a9ab82a2b5c4e93d0e6d70ad042081458b21
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/utki
{% endblock %}
