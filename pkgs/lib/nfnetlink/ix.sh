{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/libnfnetlink
{% endblock %}

{% block git_branch %}
libnfnetlink-1.0.2
{% endblock %}

{% block git_sha %}
46063bdd2537ab25bd3585c30ad2e8683022599a810e362aa0dbcf3dfaa6a44b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
