{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
dash
{% endblock %}

{% block version %}
0.5.13
{% endblock %}

{% block fetch %}
http://gondor.apana.org.au/~herbert/dash/files/dash-{{self.version().strip()}}.tar.gz
fd8da121e306b27f59330613417b182b8844f11e269531cc4720bf523e3e06d7
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
