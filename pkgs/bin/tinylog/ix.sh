{% extends '//die/c/make.sh' %}

{% block fetch %}
http://b0llix.net/perp/distfiles/perp-2.07.tar.gz
sha:1222fe31c16014d8b2a78416f93ba9f8c31eddbc381adc9021fa5d9764475815
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp perp/tinylog ${out}/bin/
{% endblock %}
