{% extends '//lib/botan/ix.sh' %}

{% block pkg_name %}
botan
{% endblock %}

{% block version %}
3.7.0
{% endblock %}

{% block fetch %}
https://github.com/randombit/botan/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:ebd1b965ed2afa12dfaf47650187142cbe870b99528185c88ca7c0ac19307c6c
{% endblock %}
