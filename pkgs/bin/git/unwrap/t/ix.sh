{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.51.0
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3524fc5fd81f16f80e1696a8281bd8ad831048b67848015d7b7382bf365ae685
{% endblock %}
