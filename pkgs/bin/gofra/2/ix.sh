{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/bd5c2a44ce62d1cd36455c3eb55f8af2497383b6.tar.gz
0e36e041443db1e0b9550b7f0a2c7de6933eefd3e3e90c81bd4c469b10ea5f6a
{% endblock %}

{% block bld_libs %}
lib/c
lib/std
lib/mnl
lib/linux/headers
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin/
{% endblock %}
