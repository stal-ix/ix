{% extends '//die/hub.sh' %}

{% block ya_git_commit %}
a9b1ae79502da4ef29c689ec7df73a94bdb845aa
{% endblock %}

{% block ya_git_sha %}
a64682926a36118f277300e1b52e67d9c355a761436bfc0693a3266f66a351ba
{% endblock %}

{% block run_deps %}
bin/ya/tools/wrapper
bin/ya/final/2(ya_boot_tc=bin/ya/final/1,ya_git_commit={{self.ya_git_commit().strip()}},ya_git_sha={{self.ya_git_sha().strip()}},clang_ver=18)
{% endblock %}
