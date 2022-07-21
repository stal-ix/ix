{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://mandoc.bsd.lv/snapshots/mandoc-1.14.6.tar.gz
md5:f0adf24e8fdef5f3e332191f653e422a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
{% endblock %}

{% block configure %}
{{super()}}
sed -e "s|/usr/local|${out}|" \
    -e "s|/nowhere/local|${out}|" \
    -e "s|/nowhere|${out}|" \
    -i Makefile.local
{% endblock %}
