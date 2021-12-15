{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://invisible-island.net/datafiles/release/byacc.tar.gz
c66b26a5dbce291e5c3c531e8d692834
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin && ln -s yacc byacc
{% endblock %}

{% block env %}
export YACC=byacc
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}
