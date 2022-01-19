{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20210808.tar.gz
e4432f5e3add4459aef28ec2017aaf05
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build %}
prefix="${out}" sh make-bootstrap.sh
{% endblock %}

{% block install %}
mkdir -p ${out}/bin ${out}/share
cp bmake ${out}/bin
cp -R mk ${out}/share/
{% endblock %}
