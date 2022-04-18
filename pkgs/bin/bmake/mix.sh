{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20220414.tar.gz
sha:10ee07a7be26b22ce6a3bbc386e2916ca8e51b0ed2d256c271a7135e3c94f2a7
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build %}
prefix="${out}" sh make-bootstrap.sh
{% endblock %}

{% block install %}
mkdir -p ${out}/bin ${out}/share
cp bmake ${out}/bin/
cp -R mk ${out}/share/
{% endblock %}
