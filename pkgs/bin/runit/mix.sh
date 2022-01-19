{% extends '//mix/template/make.sh' %}

{% block fetch %}
http://smarden.org/runit/runit-2.1.2.tar.gz
6c985fbfe3a34608eb3c53dc719172c4
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd runit*
{% endblock %}

{% block build %}
cd src
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin

for i in $(cat package/commands); do
    cp src/${i} ${out}/bin/
done
{% endblock %}
