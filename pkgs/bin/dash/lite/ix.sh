{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
dash
{% endblock %}

{% block version %}
0.5.13.1
{% endblock %}

{% block fetch %}
http://gondor.apana.org.au/~herbert/dash/files/dash-{{self.version().strip()}}.tar.gz
d9271bce09c127d9866e25c011582ddc75ab988958a04bc4d8553a3b8f30e370
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cpp_defines %}
{% if darwin %}
stat64=stat
lstat64=lstat
fstat64=fstat
{% endif %}
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block invoke_configure %}
sh configure --prefix="${out}" \
    --build={{host.gnu.three}} \
    --host={{target.gnu.three}}
{% endblock %}
