{% extends '//bin/mawk/t/ix.sh' %}

{% block pkg_name %}
mawk
{% endblock %}

{% block version %}
20200120
{% endblock %}

{% block fetch %}
https://invisible-mirror.net/archives/mawk/mawk-1.3.4-{{self.version().strip()}}.tgz
7fd4cd1e1fae9290fe089171181bbc6291dfd9bca939ca804f0ddb851c8b8237
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/5/sed
bld/boot/5/byacc
bld/boot/4/env
{% endblock %}

{% block cpp_missing %}
{{super()}}
fcntl.h
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s mawk awk
{% endblock %}
