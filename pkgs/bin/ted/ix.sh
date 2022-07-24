{% extends '//die/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/refs/tags/v2.tar.gz
sha:d211d06dc322729bc9f39d3dcc75cd43c772d63e635b57ed472e3622c838e0f2
{% endblock %}

{% block bld_libs %}
lib/c
lib/python
pip/pygments
{% endblock %}

{% block entry_point %}ted{% endblock %}
