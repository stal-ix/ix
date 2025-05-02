{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libnetfilter_cttimeout
{% endblock %}

{% block version %}
1.0.1
{% endblock %}

{% block git_repo %}
git://git.netfilter.org/libnetfilter_cttimeout
{% endblock %}

{% block git_branch %}
libnetfilter_cttimeout-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
48d05f36407df8800c5bf35fcc24f8a82ad945579941b2b321edc86f660c769f
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
