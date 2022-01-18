{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/mawk/mawk-1.3.4-20200120.tgz
d48752f402d7371d9eb5f68de3da05d4
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}

{% block bld_tool %}
dev/lang/byacc
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}
