{% extends '//die/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/refs/tags/v6.tar.gz
sha:8e220e3167ef8d447f966483d36988880b810b20a351b4dd38b791fb2a5116e3
{% endblock %}

{% block bld_libs %}
lib/c
lib/python
pip/pygments
{% endblock %}

{% block entry_point %}ted{% endblock %}
