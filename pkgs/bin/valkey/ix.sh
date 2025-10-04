{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
8.1.4
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
32350b017fee5e1a85f7e2d8580d581a0825ceae5cb3395075012c0970694dee
{% endblock %}
