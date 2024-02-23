{% extends 'base.sh' %}

{% block git_sha %}
{% endblock %}

{% block git_repo %}
{% endblock %}

{% block git_branch %}
{% endblock %}

{% block git_commit %}
{% endblock %}

{% block git_refine %}
{% endblock %}

{% block git_version %}
v1
{% endblock %}

{% block bld_deps %}
{% if self.git_sha().strip() %}
bld/stable/unpack
{% endif %}
{{super()}}
{% endblock %}

{% block bld_data %}
{% if self.git_sha().strip() %}
aux/git/{{self.git_version().strip()}}(parent_id=src_{{self.git_sha().strip()}},sha={{self.git_sha().strip()}},branch={{self.git_branch().strip()}},repo={{self.git_repo().strip()}},commit={{self.git_commit().strip()}},refine={{self.git_refine().strip() | b64e}})
{% endif %}
{{super()}}
{% endblock %}

{% block step_unpack %}
{% if self.git_sha().strip() %}
mkdir src
cd src
{% if self.git_version().strip() == 'v1' %}
stable_unpack ${GIT_TGZ}
{% else %}
stable_unpack_2 ${GIT_TGZ}
{% endif %}
{% else %}
{{super()}}
{% endif %}
{% endblock %}
