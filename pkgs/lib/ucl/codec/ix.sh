{% extends '//die/autorehell.sh' %}

{% block fetch %}
http://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz
md5:852bd691d8abc75b52053465846fba34
{% endblock %}

{% block autoreconf %}
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
