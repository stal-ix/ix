{% extends '//bin/loki/t/ix.sh' %}

# noauto

{% block version %}
3.6.17
{% endblock %}

{% block go_sha %}
ccce9e8e045a2576425dd0a93586bcb5c5af89de1cf86e10a934aa039f33f8ac
{% endblock %}

{% block unpack %}
{{super()}}
cd clients/cmd/promtail
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp promtail ${out}/bin/
{% endblock %}
