{% extends '//aux/fetch/t/ix.sh' %}

{% block fname %}
git_v3_{{parent_id}}.pzd
{% endblock %}

{% block bld_tool %}
bld/git
{{super()}}
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
{% endblock %}

{% block build %}
git init
git remote add origin {{repo}}
git fetch origin --depth 1 {{commit or branch}}
git reset --hard FETCH_HEAD
{% if git_hook_1 %}
{{git_hook_1 | b64d}}
{% endif %}
git submodule update --init --recursive --depth 1
find . -type d -name '.git' | while read l; do
    rm -rf "${l}"
done
{% endblock %}

{% block env %}
export {{src_path or 'GIT_TGZ'}}="${out}/share/{{self.fname().strip()}}"
{% endblock %}
