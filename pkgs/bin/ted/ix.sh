{% extends '//die/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/refs/tags/v4.tar.gz
sha:4897f46ee169b39b737731ffe98b465163606810f34234b6d7b9929d5f832ac9
{% endblock %}

{% block bld_libs %}
lib/c
lib/python
pip/pygments
{% endblock %}

{% block entry_point %}ted{% endblock %}
