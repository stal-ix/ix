{% extends '//bin/dropbear/stock/ix.sh' %}

{% block fetch %}
https://github.com/mkj/dropbear/archive/refs/tags/DROPBEAR_2024.86.tar.gz
sha:d16285f0233a2400a84affa0235e34a71c660908079c639fdef889c2e90c9f5f
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
