{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
zimg
{% endblock %}

{% block version %}
3.0.6
{% endblock %}

{% block fetch %}
https://github.com/sekrit-twc/zimg/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
be89390f13a5c9b2388ce0f44a5e89364a20c1c57ce46d382b1fcc3967057577
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
