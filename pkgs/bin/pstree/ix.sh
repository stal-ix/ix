{% extends '//die/inline/program.sh' %}

{% block version %}
2.40
{% endblock %}

{% block fetch %}
https://github.com/FredHucht/pstree/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:64d613d8f66685b29f13a80e08cddc08616cf3e315a0692cbbf9de0d8aa376b3
{% endblock %}

{% block step_unpack %}
mkdir src; cd src
extract 1 ${src}/*gz
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block name %}
pstree
{% endblock %}
