{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v4.16.0/iso-codes-v4.16.0.tar.gz
sha:7c990fc39a05975bedb0175e3ff09fc383048815f68b462abbf055a8032e66cc
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
