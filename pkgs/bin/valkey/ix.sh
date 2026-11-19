{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
9.1.4
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
fe3d623600a1c046b4668feec097c507b4ae52f20c1fc7f1ebd384c07a165e77
{% endblock %}
