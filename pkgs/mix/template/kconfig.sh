{% extends 'make.sh' %}

{% block host_libs %}
lib/c
lib/curses
{% endblock %}

{% block configure %}
{% set make_cmd %}
{{make_cmd_args}}
defconfig
{% endset %}
set -x
{{mix.fix_list(make_cmd)}}
{% endblock %}

{% block make_flags %}
HOSTCC=${HOST_CC}
{% endblock %}
