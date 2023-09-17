{% extends '//die/proxy.sh' %}

{% block bld_tool %}
bld/fetch/cached
{% endblock %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{fname}}", "sum": "{{sha}}"}]
{% endblock %}

{% block build %}
fetch_cached {{fname}} {{sha}} {{http_url}}
{% endblock %}

{% block install %}
mkdir ${out}/share
mv {{fname}} ${out}/share/
ls -la ${out}/share/
sha256sum ${out}/share/*
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
