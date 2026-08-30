{% extends '//aux/git/v3/ix.sh' %}

{% block fname %}
git_v4_{{parent_id}}.pzd
{% endblock %}

{% block build %}
{% if socks5_proxy %}
git config --global http.proxy 'socks5://{{socks5_proxy}}'
git config --global https.proxy 'socks5://{{socks5_proxy}}'
{% endif %}
git config --global gc.auto 0
git config --global gc.autoDetach false
git config --global maintenance.auto false
git config --global maintenance.autoDetach false
git init
git remote add origin {{repo}}
git fetch origin --depth 1 {{commit or branch}}
git reset --hard FETCH_HEAD
{% if git_hook_1 %}
{{git_hook_1 | b64d}}
{% endif %}
git submodule update --init --recursive --depth 1
find . -name '.git' -prune -exec rm -rf {} +
{% endblock %}
