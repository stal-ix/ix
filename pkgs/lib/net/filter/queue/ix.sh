{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/libnetfilter_queue
{% endblock %}

{% block git_branch %}
libnetfilter_queue-1.0.5
{% endblock %}

{% block git_sha %}
a2cbd5dfc2e2c4ded9934a7b45fb1bb014bf9527849889487b26cc60c066c94a
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
lib/nfnetlink
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

