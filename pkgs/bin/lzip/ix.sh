{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/lzip/lzip-1.24.tar.gz
sha:d42659229b10e066eeb6e81eb673cdd893b672e512d26719c2d95975556ca56c
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
