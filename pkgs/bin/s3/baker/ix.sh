{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/archiecobbs/s3backer/archive/refs/tags/2.1.3.tar.gz
sha:778545a4e6e3b651a965fb587473c78d049c97867432cbca13bfdcd3745231a3
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/curl
lib/expat
lib/fuse/2
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
