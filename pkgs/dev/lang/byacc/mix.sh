{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://invisible-island.net/datafiles/release/byacc.tar.gz
c66b26a5dbce291e5c3c531e8d692834
{% endblock %}

{% block bld_deps %}
env/std/0/mix.sh
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin && ln -s yacc byacc
{% endblock %}

{% block env %}
export YACC=byacc
{% endblock %}
