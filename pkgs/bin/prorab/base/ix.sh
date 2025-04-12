{% extends '//die/c/make.sh' %}

{% block pkg_name %}
prorab
{% endblock %}

{% block version %}
2.0.14
{% endblock %}

{% block fetch %}
https://github.com/cppfw/prorab/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:e6ef4ab18f080b24735ac6b6434be97f685f4c3184d1f88b8dbabbbc5457e1eb
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export PRORAB_DIR=${out}/include
{% endblock %}
