{% extends '//die/proxy.sh' %}

{% block use_network %}true{% endblock %}

{% set git_tgz %}git_{{parent_id}}.tar.lz4{% endset %}

{% block predict_outputs %}
[{"path": "share/{{git_tgz}}", "sum": "{{sha}}"}]
{% endblock %}

{% block bld_tool %}
bin/git
bld/stable/pack
{% endblock %}

{% block build %}
set -x
mkdir src
cd src
git init
git remote add origin {{repo}}
git fetch origin --depth 1 {{commit or branch}}
git reset --hard FETCH_HEAD
ls -la
git submodule update --init --recursive --depth 1
ls -la
find . -type d -name '.git' | while read l; do
    rm -rf "${l}"
done
{% if refine %}
{{refine | b64d}}
{% endif %}
cd ..
stable_pack {{sha}} {{git_tgz}} src
{% endblock %}

{% block install %}
mkdir ${out}/share
mv {{git_tgz}} ${out}/share/
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export GIT_TGZ="${out}/share/{{git_tgz}}"
{% endblock %}
