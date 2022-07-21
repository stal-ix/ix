{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://skarnet.org/software/mdevd/mdevd-0.1.5.1.tar.gz
sha:94ce95067809e8c53f3e32ce5fd0c53356085d069ce2f1d3168e4e38a64e90f5
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/skalibs
{% endblock %}
