{% extends '//die/autohell.sh' %}

{% block fetch %}
http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.3.tar.gz
sha:62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a
{% endblock %}

{% block bld_libs %}
lib/c
lib/edit
{% endblock %}

{% block cpp_defines %}
{% if darwin %}
stat64=stat
lstat64=lstat
fstat64=fstat
{% endif %}
{% endblock %}

{% block invoke_configure %}
sh configure --prefix="${out}" --with-libedit=yes
{% endblock %}
