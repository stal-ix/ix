{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
xmlto
{% endblock %}

{% block version %}
0.0.29
{% endblock %}

{% block fetch %}
https://pagure.io/xmlto/archive/{{self.version().strip()}}/xmlto-{{self.version().strip()}}.tar.gz
40504db68718385a4eaa9154a28f59e51e59d006d1aa14f5bc9d6fded1d6017a
{% endblock %}

{% block bld_libs %}
lib/c
lib/xslt
{% endblock %}

{% block bld_tool %}
bld/flex
bin/getopt
{% endblock %}

{% block build %}
mkdir -p man/man1
>man/man1/xmlto.1
>man/man1/xmlif.1
{{super()}}
{% endblock %}
