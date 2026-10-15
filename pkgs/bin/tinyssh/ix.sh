{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tinyssh
{% endblock %}

{% block version %}
20261001
{% endblock %}

{% block fetch %}
https://github.com/janmojzis/tinyssh/archive/refs/tags/{{self.version().strip()}}.tar.gz
f79b1b4b8db16d3b1ecc339828d48c3754e354634ac28d2fbf82c85da56e503e
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/utmp
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
