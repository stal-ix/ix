{% extends '//die/c/make.sh' %}

{% block pkg_name %}
byedpi
{% endblock %}

{% block version %}
0.17.3
{% endblock %}

{% block fetch %}
https://github.com/hufrea/byedpi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0a9cb8585554c68c3e2be88c33c9bf6f99f8e8c7f54b362285adab99e262566c
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
