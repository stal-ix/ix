{% extends '//lib/botan/ix.sh' %}

{% block pkg_name %}
botan
{% endblock %}

{% block version %}
3.14.1
{% endblock %}

{% block fetch %}
https://github.com/randombit/botan/archive/refs/tags/{{self.version().strip()}}.tar.gz
d1046b8f5b18b80197cd1d62cf66743edfc0a54ab91bf8e5d916a99212ffc5e0
{% endblock %}
