{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-20211224.tgz
fbf5249ebd6c930e1d4fe08c9683e367
{% endblock %}

{% block std_box %}
box/boot
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s yacc byacc
{% endblock %}

{% block env %}
export YACC=byacc
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
