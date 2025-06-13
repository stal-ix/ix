{% extends '//lib/gperftools/11/ix.sh' %}

{% block pkg_name %}
gperftools
{% endblock %}

{% block version %}
2.14
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-{{self.version().strip()}}.tar.gz
ab456a74af2f57a3ee6c20462f73022d11f7ffc22e470fc06dec39692c0ee5f3
{% endblock %}
