{% extends '//bin/coreutils/t/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-8.31.tar.xz
0009a224d8e288e8ec406ef0161f9293
{% endblock %}

{% block bld_tool %}
bld/byacc
{{super()}}
{% endblock %}
