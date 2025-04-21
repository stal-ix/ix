{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tinyssh
{% endblock %}

{% block version %}
20250411
{% endblock %}

{% block fetch %}
https://github.com/janmojzis/tinyssh/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:38bb076eba10f24b2c1dac531faff2a3645acd9899532dd1d57833f40aa85cd9
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/utmp
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
