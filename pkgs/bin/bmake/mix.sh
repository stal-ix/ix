{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20220208.tar.gz
sha:7b00c1e1462b2e1e54a64d8d0fcf27fc77eeaec3f13920eff8d9524ff059d6da
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
