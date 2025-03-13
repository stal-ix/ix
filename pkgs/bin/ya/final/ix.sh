{% extends '//die/hub.sh' %}

{% block ya_git_commit %}
7d18c238f372914c956a40094a252128a48e72a5
{% endblock %}

{% block ya_git_sha %}
1fcdc904b67bfe2b65bdb034800a63a3edad25faf750f7c7226114aacacfeb59
{% endblock %}

{% block run_deps %}
bin/ya/tools/wrapper
bin/ya/final/2(ya_boot_tc=bin/ya/final/1,ya_git_commit={{self.ya_git_commit().strip()}},ya_git_sha={{self.ya_git_sha().strip()}},clang_ver=18)
{% endblock %}
