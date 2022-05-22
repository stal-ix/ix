{% extends '//die/autohell.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/lzip/lzip-1.22.tar.gz
f062faf68595d594a28fade73a43c001
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
