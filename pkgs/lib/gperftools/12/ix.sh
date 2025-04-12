{% extends '//lib/gperftools/11/ix.sh' %}

{% block pkg_name %}
gperftools
{% endblock %}

{% block version %}
2.12
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-{{self.version().strip()}}.tar.gz
sha:1cc42af8c0ec117695ecfa49ef518d9eaf7b215a2657b51f655daa2dc07101ce
{% endblock %}
