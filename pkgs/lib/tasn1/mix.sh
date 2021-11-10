{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.17.0.tar.gz
c46f6eb3bd1287031ae5d36465094402
{% endblock %}

{% block bld_deps %}
dev/lang/bison/3.8.2/mix.sh
{{super()}}
{% endblock %}
