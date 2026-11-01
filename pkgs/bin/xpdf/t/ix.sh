{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
xpdf
{% endblock %}

{% block version %}
4.06
{% endblock %}

{% block fetch %}
https://dl.xpdfreader.com/xpdf-{{self.version().strip()}}.tar.gz
1c38f527c46caee0f712386d42a885b96a31ed9ce11904e872559859894d137e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/png
lib/paper
lib/freetype
{% endblock %}
