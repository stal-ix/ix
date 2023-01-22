{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/openSUSE/catatonit/archive/d8d72fea155c144ed3bf298a35a1aba5625a5656.tar.gz
sem:041d742ff44484c78593ba8ce37e7dfd4fe67b1feb4ac5ea24bdd3968fdc9d55
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
