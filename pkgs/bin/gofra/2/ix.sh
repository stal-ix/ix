{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gofra2
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/5d5936c36254594d174783eefcc01d154437f799.tar.gz
ad592bb9d0b887f8868dd50f7d8e84510fa89ece0a34608de54c965306db410f
{% endblock %}

{% block bld_libs %}
lib/c
lib/std
lib/linux/headers
{% endblock %}

{% block make_target %}
gofra2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra2 ${out}/bin/
{% endblock %}
