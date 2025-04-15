{% extends '//die/c/ix.sh' %}

{% block version %}
R59c
{% endblock %}

{% block pkg_name %}
mksh
{% endblock %}

{% block fetch %}
http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-{{self.version().strip()}}.tgz
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
