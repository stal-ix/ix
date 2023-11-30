{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/cilium/pwru/archive/refs/tags/v1.0.4.tar.gz
{% endblock %}

{% block go_sha %}
853d69ff30576d8dee9eb74e9d91ce073c2199b1f052cbaa2eacbfdaf8ded029
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcap
lib/llvm/17
{% endblock %}


