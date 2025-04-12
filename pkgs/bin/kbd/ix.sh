{% extends '//die/c/autorehell.sh' %}

{% block version %}
2.7.1
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/utils/kbd/kbd-{{self.version().strip()}}.tar.xz
sha:f167d899d92b56ccf12f6f49355173f93870a95f15d8aeebf5fdcd28a621aca8
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/flex
bld/bison
bld/gettext
{% endblock %}
