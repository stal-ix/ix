{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/libnftnl
{% endblock %}

{% block git_branch %}
libnftnl-1.2.7
{% endblock %}

{% block git_sha %}
4eada1ef4d2790dd481e0f8a94a6f2c398bd4eea11c8bf002fb1b0c2add987f6
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}



