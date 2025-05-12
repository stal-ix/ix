{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
s3backer
{% endblock %}

{% block version %}
2.1.4
{% endblock %}

{% block fetch %}
https://github.com/archiecobbs/s3backer/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:34340bf9092eeadd29d59d65edf0e59d546c76dadd3a05fff1da2839f7af9b2a
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
