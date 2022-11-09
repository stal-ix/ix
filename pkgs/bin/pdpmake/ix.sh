{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rmyorston/pdpmake/archive/refs/tags/1.4.0.tar.gz
sha:d17600f2699938980cc8734ed9f1cd993b11264e22b6fe2c18cdb8ed6ab5045d
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
