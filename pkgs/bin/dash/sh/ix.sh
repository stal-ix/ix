{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.12.tar.gz
sha:6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a
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

{% block invoke_configure %}
sh configure --prefix="${out}"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin; mv dash sh
{% endblock %}
