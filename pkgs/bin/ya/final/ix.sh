{% extends '//die/hub.sh' %}

{% block ya_git_commit %}
244ce7a7938f6e18c1c4cba41fef1af451d9725c
{% endblock %}

{% block ya_git_sha %}
afd5a4378a65a1adb45825be1fcf22702ac84d8cc9cd03835ee238540108c077
{% endblock %}

{% block run_deps %}
bin/ya/tools/wrapper
bin/ya/final/2(ya_boot_tc=bin/ya/final/1,ya_git_commit={{self.ya_git_commit().strip()}},ya_git_sha={{self.ya_git_sha().strip()}},clang_ver=18)
{% endblock %}
