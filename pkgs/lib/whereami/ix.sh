{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/gpakosz/whereami/archive/ba364cd54fd431c76c045393b6522b4bff547f50.tar.gz
sha:1d8744177f37e8386ec2f6c5992592399040cb93535ed4fd253e1976f889a744
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block build %}
cc -I. -c whereami.c
ar q libwhereami.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.a ${out}/lib
cp *.h ${out}/include
{% endblock %}
