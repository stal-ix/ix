{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.50.0
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
07d75fb5438d7bd2e3353a18abef34a2e143edcd62679f0907440d9529735d43
{% endblock %}
