{% extends '//bin/coreutils/t/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz
022042695b7d5bcf1a93559a9735e668
{% endblock %}

{% block build_flags %}
verbose
{% endblock %}

{% block bld_tool %}
bin/bison/3/6
{{super()}}
{% endblock %}
