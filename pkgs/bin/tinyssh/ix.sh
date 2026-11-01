{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tinyssh
{% endblock %}

{% block version %}
20261101
{% endblock %}

{% block fetch %}
https://github.com/janmojzis/tinyssh/archive/refs/tags/{{self.version().strip()}}.tar.gz
eb06d86c5858cfece45b9c02b7338ef0e24dfd84a39c1a963d461d022237f639
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/utmp
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
