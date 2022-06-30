{% extends '//die/autohell.sh' %}

{% block fetch %}
http://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz
sha:c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
