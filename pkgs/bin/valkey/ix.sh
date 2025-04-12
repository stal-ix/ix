{% extends '//bin/redis/t/ix.sh' %}

{% block version %}
8.1.0
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:559274e81049326251fa5b1e1c64d46d3d4d605a691481e0819133ca1f1db44f
{% endblock %}
