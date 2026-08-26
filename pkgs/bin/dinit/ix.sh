{% extends '//die/c/configure.sh' %}

{% block git_repo %}
https://github.com/davmac314/dinit
{% endblock %}

{% block pkg_name %}
dinit
{% endblock %}

{% block version %}
0.22.1
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
79be8d565f0cbaa04247a9eedebd9998871ffaa9e57c3686e2ae3b1504213ada
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/m4
{% endblock %}

{% block configure_all_flags %}
--prefix=${out}
--bindir=${out}/bin
--sbindir=${out}/bin
--syscontrolsocket=/var/run/dinit/ctl
{% endblock %}
