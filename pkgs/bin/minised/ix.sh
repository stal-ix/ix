{% extends '//die/c/make.sh' %}

{% block pkg_name %}
minised
{% endblock %}

{% block version %}
1.16
{% endblock %}

{% block fetch %}
http://dl.exactcode.de/oss/minised/minised-{{self.version().strip()}}.tar.gz
sha:46e072d5d45c9fd3d5b268523501bbea0ad016232b2d3f366a7aad0b1e7b3f71
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
