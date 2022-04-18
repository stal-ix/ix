{% extends '//bin/bmake/t/mix.sh' %}

{% block build %}
prefix="${out}" sh make-bootstrap.sh
{% endblock %}

{% block install %}
mkdir -p ${out}/bin ${out}/share
cp bmake ${out}/bin/
cp -R mk ${out}/share/
{% endblock %}
