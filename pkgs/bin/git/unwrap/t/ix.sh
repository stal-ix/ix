{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.53.0
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0492bcd8a9fc99bedca75dbec7c8c15b24dd1501c82d4518294ee0850f91f219
{% endblock %}
