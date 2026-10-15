{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.56.0
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d761232b81394f7d4c3ef1a99fa804ffbe10d278ae1ad302833a0892050ca9fc
{% endblock %}
