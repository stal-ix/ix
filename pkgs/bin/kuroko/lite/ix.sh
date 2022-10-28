{% extends '//bin/kuroko/t/ix.sh' %}

{% block make_target %}
kuroko
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp kuroko ${out}/bin/
{% endblock %}
