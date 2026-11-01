{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
9.1.3
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
184e34ed2d9b51879b682b5b15205e2b9d677c60280e3cb453be8f520d04e293
{% endblock %}
