{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
iir1
{% endblock %}

{% block version %}
1.9.5
{% endblock %}

{% block fetch %}
https://github.com/berndporr/iir1/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:beb16142e08e5f68010c6e5014dea2276ea49b71a258439eff09c5ee3f781d88
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
