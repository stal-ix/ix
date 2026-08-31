{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
9.1.1
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
7d7232acd1b8a49b4e05d07a00b3ca8c801ae06ab633ca6a3423bc5f385ab7ee
{% endblock %}
