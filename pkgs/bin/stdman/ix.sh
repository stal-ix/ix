{% extends '//die/c/make.sh' %}

{% block pkg_name %}
stdman
{% endblock %}

{% block version %}
2026.11.13
{% endblock %}

{% block fetch %}
https://github.com/jeaye/stdman/archive/refs/tags/{{self.version().strip()}}.tar.gz
deb29cc1df1ff34618f2cd4b222295db68428c462d7526aed92bd13400019740
{% endblock %}

{% block bld_tool %}
bld/bash
bld/gzip
{% endblock %}

{% block configure %}
bash ./configure --prefix="${out}"
{% endblock %}

{% block build %}
:
{% endblock %}
