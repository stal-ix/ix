{% extends '//die/c/make.sh' %}

{% block pkg_name %}
hdparm
{% endblock %}

{% block version %}
9.65
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/hdparm/hdparm-{{self.version().strip()}}.tar.gz
d14929f910d060932e717e9382425d47c2e7144235a53713d55a94f7de535a4b
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block make_flags %}
binprefix="${out}"
manprefix="${out}"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}; mv sbin bin
{% endblock %}
