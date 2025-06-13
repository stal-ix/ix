{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
faac
{% endblock %}

{% block version %}
1.31.1
{% endblock %}

{% block fetch %}
https://github.com/knik0/faac/archive/refs/tags/faac-{{self.version().strip()}}.tar.gz
3191bf1b131f1213221ed86f65c2dfabf22d41f6b3771e7e65b6d29478433527
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
