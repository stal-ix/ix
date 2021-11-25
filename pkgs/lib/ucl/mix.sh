{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz
852bd691d8abc75b52053465846fba34
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
{% endblock %}
