{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
8.1.2
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:747b272191c15c7387f4ad3b3e7eda16deb1cffc6425e0571547f54e4d2e3646
{% endblock %}
