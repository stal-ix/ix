{% extends '//bin/gdb/13/ix.sh' %}

{% block pkg_name %}
gdb
{% endblock %}

{% block version %}
12.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdb/gdb-{{self.version().strip()}}.tar.xz
sha:0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|return rl_completer_word_break_characters|return (char*)rl_completer_word_break_characters|' -i gdb/completer.c
{% endblock %}
