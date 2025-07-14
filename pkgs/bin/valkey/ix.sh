{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
8.1.3
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
8f862b3b0a72fd40587793964539589f6f83d01361ca1598b370cfaa301e0ec0
{% endblock %}
