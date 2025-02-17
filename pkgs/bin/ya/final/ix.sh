{% extends '//die/hub.sh' %}

{% block ya_git_commit %}
8c3d07be192209a91266dd19f883ddff01488b1b
{% endblock %}

{% block ya_git_sha %}
df99b2ba52a1e7797426739a0364bdddb047f188f407aa69840261161c1bcf6f
{% endblock %}

{% block run_deps %}
bin/ya/tools/wrapper
bin/ya/final/2(ya_boot_tc=bin/ya/final/1,ya_git_commit={{self.ya_git_commit().strip()}},ya_git_sha={{self.ya_git_sha().strip()}},clang_ver=18)
{% endblock %}
