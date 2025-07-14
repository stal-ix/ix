{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.50.1
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4932f262b88b7f4f8402e331a7ee8d0a98ba350aa2269ce3a00eeda18cb4fe43
{% endblock %}
