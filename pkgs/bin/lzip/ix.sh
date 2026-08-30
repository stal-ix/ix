{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
lzip
{% endblock %}

{% block version %}
1.26
{% endblock %}

{% block fetch %}
https://download.savannah.gnu.org/releases/lzip/lzip-{{self.version().strip()}}.tar.gz
641cf30961525cbe3b340cc883436c8854e9f5032f459f444de4782b621e6572
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
