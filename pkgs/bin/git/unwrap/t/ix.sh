{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.55.0
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
72923418db7b26dfddc21e2268660c5118e560bdfaa09b4489b67b38e9b69c49
{% endblock %}
