{% extends '//bin/gdb/14/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdb/gdb-12.1.tar.xz
sha:0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|return rl_completer_word_break_characters|return (char*)rl_completer_word_break_characters|' -i gdb/completer.c
{% endblock %}
