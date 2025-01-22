{% extends '//die/hub.sh' %}

{% block ya_git_commit %}
2f845a4ff73ae20585ae92ac8c55dbba429ce1b3
{% endblock %}

{% block ya_git_sha %}
9d472b620865f6553797582e375012a5b5e28a3b0c1eb5e6f701bd4e06596293
{% endblock %}

{% block run_deps %}
bin/ya/tools/wrapper
bin/ya/final/2(ya_boot_tc=bin/ya/final/1,ya_git_commit={{self.ya_git_commit().strip()}},ya_git_sha={{self.ya_git_sha().strip()}},clang_ver=18)
{% endblock %}
