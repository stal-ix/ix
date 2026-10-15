{% extends '//die/c/make.sh' %}

{% block pkg_name %}
prorab
{% endblock %}

{% block version %}
2.0.31
{% endblock %}

{% block fetch %}
https://github.com/cppfw/prorab/archive/refs/tags/{{self.version().strip()}}.tar.gz
4661c4911e8b34caa58a975a2600ace00fe73869431babe4d17360254d80569f
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export PRORAB_DIR=${out}/include
{% endblock %}
