{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.52.0
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
da8be57afb73a2370a5a891405b5e5624562f07a5c041f9e827e75320dc61114
{% endblock %}
