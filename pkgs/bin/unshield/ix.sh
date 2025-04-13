{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
unshield
{% endblock %}

{% block version %}
1.6.0
{% endblock %}

{% block fetch %}
https://github.com/twogood/unshield/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:c3974a906ddbdc2805b3f6b36cb01f11fe0ede7a7702514acb2ad4a66ec7ae62
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/openssl
{% endblock %}
