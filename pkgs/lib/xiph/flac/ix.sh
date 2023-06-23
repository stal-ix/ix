{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/xiph/flac/archive/refs/tags/1.4.3.tar.gz
sha:0a4bb82a30609b606650d538a804a7b40205366ce8fc98871b0ecf3fbb0611ee
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
