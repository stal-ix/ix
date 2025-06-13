{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rlwrap
{% endblock %}

{% block version %}
0.46.2
{% endblock %}

{% block fetch %}
https://github.com/hanslub42/rlwrap/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9abb0a0dc19e85794d9b8e72e480530563eb4ee1bf243e87c0e0dd05ea4a2f09
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}
