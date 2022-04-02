{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libidn/libidn2-2.3.1.tar.gz
cda07f5ac55fccfafdf7ee01828adad5
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
lib/unistring
{% endblock %}

{% block make_ver %}
1/16/1
{% endblock %}

{% block c_rename_symbol %}
error
{% endblock %}

{% block autoreconf %}
automake --add-missing
{% endblock %}

{% block bld_tool %}
bld/autohell/full
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libidn2=${out} \${COFLAGS}"
{% endblock %}
