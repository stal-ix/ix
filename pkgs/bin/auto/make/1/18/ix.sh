{% extends '//bin/auto/make/1/16/3/ix.sh' %}

{% block version %}
1.18
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-{{self.version().strip()}}.tar.xz
sha:5bdccca96b007a7e344c24204b9b9ac12ecd17f5971931a9063bdee4887f4aaf
{% endblock %}
