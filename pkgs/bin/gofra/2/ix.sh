{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gofra2
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/4fb45433aac7579593d32431a3ca28f3ac366639.tar.gz
0a6d530cb0e37db2de2895b1690ee7c83ec54ea9190f6f3f39d4dac64994733e
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
