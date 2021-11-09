{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/mawk/mawk-1.3.4-20200120.tgz
d48752f402d7371d9eb5f68de3da05d4
{% endblock %}

{% block bld_deps %}
lib/readline/mix.sh
dev/lang/byacc/mix.sh
env/std/0/mix.sh
{% endblock %}
