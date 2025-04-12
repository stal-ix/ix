{% extends '//lib/gperftools/11/ix.sh' %}

{% block pkg_name %}
gperftools
{% endblock %}

{% block version %}
2.15
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-{{self.version().strip()}}.tar.gz
sha:3918ff2e21bb3dbb5a801e1daf55fb20421906f7c42fbb482bede7bdc15dfd2e
{% endblock %}
