{% extends '//mix/template/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/5405a729a58f8e8218b3e656cbb289d5fd989dd2.zip
47e5546469892a72f7e54cc6aeaeb5aa
{% endblock %}

{% block bld_libs %}
lib/c
lib/python
pypi/pygments
{% endblock %}

{% block entry_point %}ted{% endblock %}
