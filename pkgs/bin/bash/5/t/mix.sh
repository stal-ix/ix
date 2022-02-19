{% extends '//bin/bash/t/mix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bash/bash-5.1.16.tar.gz
sha:5bac17218d3911834520dad13cd1f85ab944e1c09ae1aba55906be1f8192f558
{% endblock %}

{% block patch %}
rm y.tab* lib/intl/plural.c

bison -d parse.y

cp parse.tab.c y.tab.c
cp parse.tab.h y.tab.h

{{super()}}
{% endblock %}
