{% extends '//die/c/make.sh' %}

{% block pkg_name %}
dte
{% endblock %}

{% block version %}
1.11.1
{% endblock %}

{% block fetch %}
https://gitlab.com/craigbarnes/dte/-/archive/v{{self.version().strip()}}/dte-v{{self.version().strip()}}.tar.bz2
d6260e35b833ec7f20b1260ad669ebc39ef7a8da3e6591b848e5a45fef5ea651
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
{% endblock %}
