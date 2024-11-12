{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/janmojzis/tinyssh/archive/refs/tags/20241111.tar.gz
sha:c33e0c2a403058c70a279a6c0c0b65fba5d54f9217f51ddce04d0d7fed73abac
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/utmp
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
