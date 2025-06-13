{% extends '//die/std/ix.sh' %}

{% block version %}
1
{% endblock %}

{% block pkg_name %}
deya
{% endblock %}

{% block fetch %}
https://github.com/pg83/deya/archive/refs/tags/{{self.version().strip()}}.tar.gz
ff1e113a0df3187e373a473a040235cd38705fe47e80e6c29736c32d69a1f10e
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp deya ${out}/bin/
chmod +x ${out}/bin/*
{% endblock %}
