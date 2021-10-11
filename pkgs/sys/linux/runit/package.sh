{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url http://smarden.org/runit/runit-2.1.2.tar.gz
# md5 6c985fbfe3a34608eb3c53dc719172c4
{% endblock %}

{% block deps %}
# bld env/std dev/build/make
{% endblock %}

{% block postunpack %}
cd runit*
{% endblock %}

{% block build %}
cd src && make -j ${make_thrs}
{% endblock %}

{% block install %}
mkdir ${out}/bin

for i in $(cat package/commands); do
    cp src/${i} ${out}/bin/
done
{% endblock %}
