{% extends '//die/proxy.sh' %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{parent_id}}.tar.lz4", "sum": "{{sha}}"}]
{% endblock %}

{% block bld_tool %}
bin/git
bin/tar
bin/lz4
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
tar --sort=name --owner=root:0 --group=root:0 --mtime='UTC 1970-01-01'  -c -f {{parent_id}}.tar src
{% endblock %}

{% block install %}
mkdir ${out}/share
lz4 {{parent_id}}.tar ${out}/share/{{parent_id}}.tar.lz4
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
