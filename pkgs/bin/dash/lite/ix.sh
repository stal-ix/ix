{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
dash
{% endblock %}

{% block version %}
0.5.12
{% endblock %}

{% block fetch %}
http://gondor.apana.org.au/~herbert/dash/files/dash-{{self.version().strip()}}.tar.gz
6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a
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
