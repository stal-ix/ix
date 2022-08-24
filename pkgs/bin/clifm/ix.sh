{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v1.7.tar.gz
sha:6408fe75c80646f33cd1ffab5b7e81ca098e70bd01cbd7b20d3ecbe870dc47c9
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/acl
lib/magic
lib/readline
{% endblock %}
