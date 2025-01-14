{% extends '//die/hub.sh' %}

{% block ya_git_commit %}
4ff6a77559396e5434ed2c7fc5695c7eadf3fc14
{% endblock %}

{% block ya_git_sha %}
7b0752970a482c6e31739f2fb499d59dde9bbd033f76ae105a623d65d5efb404
{% endblock %}

{% block run_deps %}
bin/ya/wrapper
bin/ya/final/unwrap(ya_boot_tc=bin/ya/final/0,ya_git_commit={{self.ya_git_commit().strip()}},ya_git_sha={{self.ya_git_sha().strip()}},clang_ver=18)
{% endblock %}
