{% extends '//bin/ya/bootstrap/t/ix.sh' %}

{% block git_commit %}
{{ya_git_commit}}
{% endblock %}

{% block git_sha %}
{{ya_git_sha}}
{% endblock %}

{% block bld_tool %}
{{ya_boot_tc}}(ya_git_commit={{ya_git_commit}},ya_git_sha={{ya_git_sha}},clang_ver={{clang_ver}})
{{super()}}
{% endblock %}

{% block ya_make_targets %}
devtools/ymake/bin/ymake
devtools/ya/bin/ya-bin
{% endblock %}

{% block patch %}
{{super()}}
find contrib/libs/libunwind -type f | while read l; do
    sed -e 's|#pragma.*||' -i ${l}
done
{% endblock %}
