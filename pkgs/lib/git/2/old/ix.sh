{% extends '//lib/git/2/ix.sh' %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v1.0.1.tar.gz
sha:1775427a6098f441ddbaa5bd4e9b8a043c7401e450ed761e69a415530fea81d2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ssh/2
lib/pcre/2
lib/openssl
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/python
{% endblock %}
