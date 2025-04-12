{% extends '//bin/grpc/java/ix.sh' %}

{% block pkg_name %}
grpc-java
{% endblock %}

{% block version %}
1.51.3
{% endblock %}

{% block fetch %}
https://github.com/grpc/grpc-java/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:3fa74ebe3f37177a4c23449a4937e98507280ed4691c12704824c2bbe4d0d59b
{% endblock %}
