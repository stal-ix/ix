{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms2.13.tar.gz
sha:16de4bc1e83a5f8aa4e395d9734396cb6ffe7263648d35f39b0fcf933082f93b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
