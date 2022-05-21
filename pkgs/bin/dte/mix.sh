{% extends '//die/make.sh' %}

{% block fetch %}
https://gitlab.com/craigbarnes/dte/-/archive/v1.10/dte-v1.10.tar.bz2
sha:9c414be6a85486b4a934acf6c07ea8d8c1b7ae64321f2546c44ec3d0a76b02ff
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
{% endblock %}
