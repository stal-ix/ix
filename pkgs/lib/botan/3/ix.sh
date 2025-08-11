{% extends '//lib/botan/ix.sh' %}

{% block pkg_name %}
botan
{% endblock %}

{% block version %}
3.9.0
{% endblock %}

{% block fetch %}
https://github.com/randombit/botan/archive/refs/tags/{{self.version().strip()}}.tar.gz
89dabf2e9bdb889242f73e579ac7e25e095e28e549bf83a00357602bc47f2618
{% endblock %}
