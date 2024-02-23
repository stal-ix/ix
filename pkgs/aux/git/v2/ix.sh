{% extends '//aux/fetch/ix.sh' %}

{% set fname %}git_{{parent_id}}.tar.lz4{% endset %}

{% block bld_tool %}
bin/git/unwrap
{{super()}}
{% endblock %}

{% block build %}
git init
git remote add origin {{repo}}
git fetch origin --depth 1 {{commit or branch}}
git reset --hard FETCH_HEAD
git submodule update --init --recursive --depth 1
find . -type d -name '.git' | while read l; do
    rm -rf "${l}"
done
{% endblock %}

{% block env %}
{{super()}}
export GIT_TGZ="${out}/share/{{fname}}"
{% endblock %}
