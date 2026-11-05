{% extends '//lib/botan/ix.sh' %}

{% block pkg_name %}
botan
{% endblock %}

{% block version %}
3.14.0
{% endblock %}

{% block fetch %}
https://github.com/randombit/botan/archive/refs/tags/{{self.version().strip()}}.tar.gz
1c129721621920ffa33b8e150090dd32b850463b98f5b0e034d7ae17c5813669
{% endblock %}
