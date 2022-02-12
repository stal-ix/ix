{% extends '//mix/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/hdparm/hdparm-9.63.tar.gz
sha:70785deaebba5877a89c123568b41dee990da55fc51420f13f609a1072899691
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block make_flags %}
binprefix="${out}"
manprefix="${out}"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}; mv sbin bin
{% endblock %}
