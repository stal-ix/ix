{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://taglib.org/releases/taglib-1.12.tar.gz
sha:7fccd07669a523b07a15bd24c8da1bbb92206cb19e9366c3692af3d79253b703
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
