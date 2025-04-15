{% extends '//lib/botan/ix.sh' %}

{% block pkg_name %}
botan
{% endblock %}

{% block version %}
3.7.1
{% endblock %}

{% block fetch %}
https://github.com/randombit/botan/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:8d2a072c7cdca6cadd16f89bb966fce1b3ec77cb4614bf1d87dec1337a3d2330
{% endblock %}
