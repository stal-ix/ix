{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libnetfilter_cttimeout
{% endblock %}

{% block version %}
1.0.0
{% endblock %}

{% block git_repo %}
git://git.netfilter.org/libnetfilter_cttimeout
{% endblock %}

{% block git_branch %}
libnetfilter_cttimeout-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
fb5940f89ad8d5c415a50a5c9851359ae986cb7dcaa9913eef07ef9fc2498107
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
