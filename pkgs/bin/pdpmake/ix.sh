{% extends '//die/c/make.sh' %}

{% block pkg_name %}
pdpmake
{% endblock %}

{% block version %}
2.0.4
{% endblock %}

{% block fetch %}
https://github.com/rmyorston/pdpmake/archive/refs/tags/{{self.version().strip()}}.tar.gz
7e19294d54edf360591d76d3b7a0a511864902ac3a75a0b5b11c7b3cae14c13f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
