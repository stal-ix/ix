{% extends '//die/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/refs/tags/v1.tar.gz
sha:cf97515dfbbdee7bcaf154627064c09d6eae18bbea56901d8374250e80537679
{% endblock %}

{% block bld_libs %}
lib/c
lib/python
pip/pygments
{% endblock %}

{% block entry_point %}ted{% endblock %}
