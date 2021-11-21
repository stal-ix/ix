{% extends '//mix/template/std.sh' %}

{% block fetch %}
http://prdownloads.sourceforge.net/sbcl/sbcl-2.1.10-x86-64-linux-binary.tar.bz2
8493d65038bc5da1702228da09be354d
{% endblock %}

{% block bld_tool %}
dev/build/make/mix.sh
{% endblock %}

{% block install %}
INSTALL_ROOT=${out} dash install.sh
{% endblock %}
