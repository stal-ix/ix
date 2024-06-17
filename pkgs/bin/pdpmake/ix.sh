{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rmyorston/pdpmake/archive/refs/tags/2.0.0.tar.gz
sha:72ef8b7e691dfdf1cc5dd979654870e8cf664a4305ac155165ddfb77ba945854
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
