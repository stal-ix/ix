{% extends '//lib/botan/ix.sh' %}

{% block pkg_name %}
botan
{% endblock %}

{% block version %}
3.10.0
{% endblock %}

{% block fetch %}
https://github.com/randombit/botan/archive/refs/tags/{{self.version().strip()}}.tar.gz
28a98475e05dc2052654397207b4a78e36e6309b662f7f2888feb78cc948cea6
{% endblock %}
