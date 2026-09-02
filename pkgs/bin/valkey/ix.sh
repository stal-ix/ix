{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
9.1.2
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
19c23908e7d57e8d91ef85b41f5646307582f10f4f0fb999bbf89ed24ec9c983
{% endblock %}
