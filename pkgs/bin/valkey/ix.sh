{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
9.2.0
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
a02cb44db1269b699629e419d4949e6e51e984b1f0e9a984e8ee1e1b3b7cc36f
{% endblock %}
