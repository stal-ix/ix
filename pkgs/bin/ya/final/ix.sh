{% extends '//die/hub.sh' %}

{% block ya_git_commit %}
f028492ed178ab9e17b781395f1ebc569134e2a8
{% endblock %}

{% block ya_git_sha %}
9f6e937ec7fb9d1d7d352ecb5290f55dd7e73331ee93705dd9f20b8529d2bebb
{% endblock %}

{% block run_deps %}
bin/ya/tools/wrapper
bin/ya/final/2(ya_boot_tc=bin/ya/final/1,ya_git_commit={{self.ya_git_commit().strip()}},ya_git_sha={{self.ya_git_sha().strip()}},clang_ver=18)
{% endblock %}
