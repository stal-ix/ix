{% extends '//bin/byacc/bt/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s yacc byacc
{% endblock %}

{% block env %}
export YACC=byacc
{% endblock %}
