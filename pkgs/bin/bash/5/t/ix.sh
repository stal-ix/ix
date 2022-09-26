{% extends '//bin/bash/t/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bash/bash-5.2.tar.gz
sha:a139c166df7ff4471c5e0733051642ee5556c1cc8a4a78f145583c5c81ab32fb
{% endblock %}

{% block patch %}
rm y.tab* lib/intl/plural.c

bison -d parse.y

cp parse.tab.c y.tab.c
cp parse.tab.h y.tab.h

{{super()}}
{% endblock %}
