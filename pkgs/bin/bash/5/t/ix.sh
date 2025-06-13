{% extends '//bin/bash/t/ix.sh' %}

{% block pkg_name %}
bash
{% endblock %}

{% block version %}
5.2.37
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bash/bash-{{self.version().strip()}}.tar.gz
9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff
{% endblock %}

{% block patch %}
rm y.tab* lib/intl/plural.c

bison -d parse.y

cp parse.tab.c y.tab.c
cp parse.tab.h y.tab.h

{{super()}}
{% endblock %}
