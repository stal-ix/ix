{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://invisible-island.net/datafiles/release/byacc.tar.gz
# md5 ad027e9a1a78666e3e27924ce6854f97
{% endblock %}

{% block deps %}
# bld dev/build/make env/std
{% endblock %}

{% block postinstall %}
cd ${out}/bin && ln -s yacc byacc
{% endblock %}
