{% extends '//bin/gdb/t/ix.sh' %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_libs %}
bin/gdb/shim
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|return rl_completer_word_break_characters|return (char*)rl_completer_word_break_characters|' -i gdb/completer.c
#sed -e 's|SVE_SIG_ZREGS_SIZE|XXXYYY|' -i gdb/nat/aarch64-sve-linux-ptrace.h
cat << EOF > gdbserver/Makefile.in
all:
install:
EOF
{% endblock %}
