{% extends '//lib/sqlite/3/t/t/ix.sh' %}

{% block configure %}
{% endblock %}

{% block build %}
${CC} -o jimsh0 autosetup/jimsh0.c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp jimsh0 ${out}/bin/jimsh
{% endblock %}
