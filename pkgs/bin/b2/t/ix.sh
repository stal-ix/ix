{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/bfgroup/b2/archive/refs/tags/5.1.0.tar.gz
sha:4d1e5d262f8055e6d639703c5c1ae0aca70c7c453d51a2adc28367fe501d9fa5
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
