{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.56.1
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7352791502f1b9745e7414e15e4ae9b7bb4773428b9a1b4f7beb3fdd1073aba4
{% endblock %}
