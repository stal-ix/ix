{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
dash
{% endblock %}

{% block version %}
0.5.13.6
{% endblock %}

{% block fetch %}
http://gondor.apana.org.au/~herbert/dash/files/dash-{{self.version().strip()}}.tar.gz
26aac476f476cef391c600cb064417d82a5465d8fc7c4fd56158c276e86538c1
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
