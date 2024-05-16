{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://mandoc.bsd.lv/snapshots/mandoc-1.14.6.tar.gz
sha:8bf0d570f01e70a6e124884088870cbed7537f36328d512909eb10cd53179d9c
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

{% block install %}
{{super()}}
cd ${out}
mv sbin/* bin/
rm -rf sbin
{% endblock %}
