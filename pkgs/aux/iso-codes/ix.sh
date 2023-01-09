{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v4.12.0/iso-codes-v4.12.0.tar.gz
sha:ead53ac6cb000a726350eda10381b2339e7bed0680924d761d63f28f32da94b5
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block strip_pc %}
:
{% endblock %}

{% block env %}
export ISO_CODES=${out}
{% endblock %}
