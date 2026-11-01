{% extends '//lib/wlroots/17/ix.sh' %}

{% block pkg_name %}
wlroots
{% endblock %}

{% block version %}
0.18.3
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/{{self.version().strip()}}/wlroots-{{self.version().strip()}}.tar.bz2
17420d4e6fa3fe9c3c5022af2706ec25c3fbd861688d69052b7ef0e77dfb1f90
{% endblock %}
