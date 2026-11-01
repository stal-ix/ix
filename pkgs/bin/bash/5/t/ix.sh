{% extends '//bin/bash/t/ix.sh' %}

{% block pkg_name %}
bash
{% endblock %}

{% block version %}
5.3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bash/bash-{{self.version().strip()}}.tar.gz
0d5cd86965f869a26cf64f4b71be7b96f90a3ba8b3d74e27e8e9d9d5550f31ba
{% endblock %}

{% block patch %}
rm y.tab* lib/intl/plural.c

bison -d parse.y

cp parse.tab.c y.tab.c
cp parse.tab.h y.tab.h

{{super()}}
{% endblock %}
