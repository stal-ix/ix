{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
xvidcore
{% endblock %}

{% block version %}
1.3.7
{% endblock %}

{% block fetch %}
https://downloads.xvid.com/downloads/xvidcore-{{self.version().strip()}}.tar.gz
abbdcbd39555691dd1c9b4d08f0a031376a3b211652c0d8b3b8aa9be1303ce2d
{% endblock %}

{% block unpack %}
{{super()}}
cd build/generic
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
