{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
smenu
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://github.com/p-gen/smenu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:76b5f2ba181ac4d377fde30181fc6f2ecc7cdef82cf78796c18e59b7a033b9c9
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
