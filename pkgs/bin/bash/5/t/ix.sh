{% extends '//bin/bash/t/ix.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block patch %}
rm y.tab* lib/intl/plural.c

bison -d parse.y

cp parse.tab.c y.tab.c
cp parse.tab.h y.tab.h

{{super()}}
{% endblock %}
