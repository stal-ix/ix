{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree
{% endblock %}

{% block version %}
2.3.2
{% endblock %}

{% block fetch %}
https://github.com/Old-Man-Programmer/tree/archive/refs/tags/{{self.version().strip()}}.tar.gz
22cf32e84e3eb508d97a9e991c2c3cc006b9dcf4afed201d96311c5c57d08fcf
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
