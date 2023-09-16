{% extends '//die/proxy.sh' %}

{% block bld_tool %}
bin/aria/2
{% endblock %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{fname}}", "sum": "{{sha}}"}]
{% endblock %}

{% set mirrors %}
{% include '//die/scripts/mirrors.txt' %}
{% endset %}

{% set args %}
--no-conf=true
--out={{fname}}
--async-dns=false
--uri-selector=inorder
--check-certificate=false
--checksum=sha-256={{sha}}
--console-log-level=notice
{{http_url}}
{% for m in mirrors.strip().split() %}
{{m}}/{{sha}}
{% endfor %}
{% endset %}

{% block build %}
aria2c {{ix.fix_list(args)}}
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
