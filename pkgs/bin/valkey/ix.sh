{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
9.0.0
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
088f47e167eb640ea31af48c81c5d62ee56321f25a4b05d4e54a0ef34232724b
{% endblock %}
