{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gofra2
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/c28f6f87ed2345a3064fe48a7625859b86109d00.tar.gz
059a8a0c3378f925150b8672ff3de259f554cdd1dc2159302012e8560f86b925
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
