{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gofra2
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/6103176536e46765524bd63d12c32beb51ebc913.tar.gz
40ca36e43640a56a04bda6e113fe25ac47b657a78a79f4b662e22d314ebe4951
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
