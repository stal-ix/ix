{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
unshield
{% endblock %}

{% block version %}
1.6.2
{% endblock %}

{% block fetch %}
https://github.com/twogood/unshield/archive/refs/tags/{{self.version().strip()}}.tar.gz
a937ef596ad94d16e7ed2c8553ad7be305798dcdcfd65ae60210b1e54ab51a2f
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/openssl
{% endblock %}
