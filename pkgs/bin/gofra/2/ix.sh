{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gofra2
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/80b105577756f285cbddd8e31c587a2cdba2c8db.tar.gz
05ebfded0f864c893845865d589c01d2d3ecb7c6d11d29eaae4bccc18cd6e8a0
{% endblock %}

{% block bld_libs %}
lib/c
lib/std
lib/mnl
lib/linux/headers
{% endblock %}

{% block make_target %}
gofra2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra2 ${out}/bin/
{% endblock %}
