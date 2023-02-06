{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/mawk/mawk-1.3.4-20230203.tgz
sha:6db7a32ac79c51107ad31a407d4f92c6b842dde2f68a7533b4e7b7b03e8900be
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}
