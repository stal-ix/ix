{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz
39d3f3f9c55c87b1e5d6888e1420f4b5
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}
