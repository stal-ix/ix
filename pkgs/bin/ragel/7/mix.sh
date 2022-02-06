{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/adrian-thurston/ragel/archive/refs/tags/7.0.4.tar.gz
04bfa8473ea5a8bbab3d607a07103aea
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
