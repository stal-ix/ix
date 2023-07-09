{% extends '//die/proxy.sh' %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{parent_id}}.tar.lz4", "sum": "{{sha}}"}]
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
cd ..
stable_pack {{parent_id}}.tar.lz4 src
{% endblock %}

{% block install %}
mkdir ${out}/share
mv {{parent_id}}.tar.lz4 ${out}/share/
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
