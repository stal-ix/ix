{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz
aeb29c6a90350a4c959cd1df38cd0a7e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
bin/flex
bin/bison/3/8
{{super()}}
{% endblock %}
