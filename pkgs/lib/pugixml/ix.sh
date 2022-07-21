{% extends '//die/c/cmake.sh' %}

{% block fetch %}
http://github.com/zeux/pugixml/releases/download/v1.12/pugixml-1.12.tar.gz
sha:fd6922a4448ec2f3eb9db415d10a49660e5d84ce20ce66b8a07e72ffc84270a7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
