{% extends 'base.sh' %}

{% set git_sha %}{% block git_sha %}{% endblock %}{% endset %}

{% set git_repo %}
{% block git_repo %}
{% endblock %}
{% endset %}

{% set git_branch %}
{% block git_branch %}
{% endblock %}
{% endset %}

{% block bld_deps %}
{% if git_sha %}
bin/lz4
{% endif %}
{{super()}}
{% endblock %}

{% block bld_data %}
{% if git_sha %}
aux/git(parent_id={{uniq_id}},sha={{git_sha.strip()}},branch={{git_branch.strip()}},repo={{git_repo.strip()}})
{% endif %}
{{super()}}
{% endblock %}

{% block step_unpack %}
{% if git_sha %}
mkdir src; cd src
lz4 -d ${src}/*lz4 - | bsdtar -x -f - --no-same-permissions --no-same-owner --strip-components 1
{% else %}{{super()}}{% endif %}
{% endblock %}
