{% extends '//die/c/make.sh' %}

{% block pkg_name %}
pdpmake
{% endblock %}

{% block version %}
2.0.3
{% endblock %}

{% block fetch %}
https://github.com/rmyorston/pdpmake/archive/refs/tags/{{self.version().strip()}}.tar.gz
92fe09b614ebe94de25154b383cc136b07f75e26d5e2febf27a343c4b8fa18ad
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
