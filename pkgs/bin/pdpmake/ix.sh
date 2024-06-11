{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rmyorston/pdpmake/archive/refs/tags/1.4.3.tar.gz
sha:e078ab376683de2a3044826c301f0cdef1147065f5244b52af33727797489819
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
