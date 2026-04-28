{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/9ead179d8ae30bfcc1045e78d6b65a8a137de4b3.tar.gz
fd2679dec942aaa01d1a88b103a0f9541f367772bbe93071709ee2395cef3b99
{% endblock %}

{% block bld_libs %}
lib/c
lib/std
lib/mnl
lib/linux/headers
{% endblock %}

{% block make_target %}
gofra
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin/
{% endblock %}
