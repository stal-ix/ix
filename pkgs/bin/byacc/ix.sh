{% extends '//die/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-20211224.tgz
md5:fbf5249ebd6c930e1d4fe08c9683e367
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
