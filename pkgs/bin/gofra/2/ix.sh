{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/779b75695ff11b118b2a5c9e54c784afa1e0a3bb.tar.gz
7bf5d34f7c077fa78dfced998c24e10d8de2baf8d0786fbca021b2b16fb5d6d5
{% endblock %}

{% block bld_libs %}
lib/c
lib/std
lib/mnl
lib/linux/headers
{% endblock %}

{% block make_target %}
gofra
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin/
{% endblock %}
