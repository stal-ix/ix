{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/lzip/lzip-1.24.1.tar.gz
sha:30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
