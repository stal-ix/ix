{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://download.savannah.nongnu.org/releases/libpipeline/libpipeline-1.5.8.tar.gz
sha:1b1203ca152ccd63983c3f2112f7fe6fa5afd453218ede5153d1b31e11bb8405
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
