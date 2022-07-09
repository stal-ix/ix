{% extends '//die/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/hdparm/hdparm-9.64.tar.gz
sha:315b956951c3fea027287de204381534217c0bd0f37b4935877fe2db0cab859a
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
