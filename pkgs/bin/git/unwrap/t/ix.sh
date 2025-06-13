{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.49.0
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1bfeeafc78036e78c7b422219473987a6fa79bfdc1da673fcf20e4901399e09f
{% endblock %}
