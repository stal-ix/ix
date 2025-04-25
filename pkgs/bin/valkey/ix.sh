{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
8.1.1
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:3355fbd5458d853ab201d2c046ffca9f078000587ccbe9a6c585110f146ad2c5
{% endblock %}
