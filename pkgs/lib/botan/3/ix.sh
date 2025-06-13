{% extends '//lib/botan/ix.sh' %}

{% block pkg_name %}
botan
{% endblock %}

{% block version %}
3.8.1
{% endblock %}

{% block fetch %}
https://github.com/randombit/botan/archive/refs/tags/{{self.version().strip()}}.tar.gz
8eb79a49c1a3f7e5e7563c13752a37557de935cdac48d9221ea4b580158e8965
{% endblock %}
