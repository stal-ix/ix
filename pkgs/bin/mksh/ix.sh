{% extends '//die/c/ix.sh' %}

{% block fetch %}
http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R59c.tgz
sha:77ae1665a337f1c48c61d6b961db3e52119b38e58884d1c89684af31f87bc506
{% endblock %}

{% block bld_tool %}
bin/groff
{% endblock %}

{% block build %}
sh Build.sh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp mksh ${out}/bin/
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
