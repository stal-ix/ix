{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
s3backer
{% endblock %}

{% block version %}
2.1.5
{% endblock %}

{% block fetch %}
https://github.com/archiecobbs/s3backer/archive/refs/tags/{{self.version().strip()}}.tar.gz
7650bd1f683e5a8c18c31a2e9f73d5f584b327952ceb22ee042a1ee6ecb737c5
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/curl
lib/expat
lib/fuse/3
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
