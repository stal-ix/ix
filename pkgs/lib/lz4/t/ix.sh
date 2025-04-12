{% extends '//die/c/make.sh' %}

{% block version %}
1.10.0
{% endblock %}

{% block fetch %}
https://github.com/lz4/lz4/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
