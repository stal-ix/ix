{% extends '//die/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/refs/tags/v5.tar.gz
sha:ab77978a182a737ccb2001cb819407538687a9ef503fe18449b7d4e3608600ce
{% endblock %}

{% block bld_libs %}
lib/c
lib/python
pip/pygments
{% endblock %}

{% block entry_point %}ted{% endblock %}
