{% extends '//die/c/configure.sh' %}

{% block git_repo %}
https://github.com/davmac314/dinit
{% endblock %}

{% block pkg_name %}
dinit
{% endblock %}

{% block version %}
0.23.0
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
441b46bc2060328eacae753610f54b949574f8bae3ac30a9fda6a10a6253d1c1
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
