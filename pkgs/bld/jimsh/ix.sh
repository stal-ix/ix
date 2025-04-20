{% extends '//lib/sqlite/3/t/t/ix.sh' %}

{% block build %}
test -f jimsh0
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp jimsh0 ${out}/bin/jimsh
{% endblock %}
