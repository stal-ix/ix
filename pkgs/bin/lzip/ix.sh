{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
lzip
{% endblock %}

{% block version %}
1.25
{% endblock %}

{% block fetch %}
https://download.savannah.gnu.org/releases/lzip/lzip-{{self.version().strip()}}.tar.gz
sha:09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
