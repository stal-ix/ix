{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://launchpad.net/libmetalink/trunk/libmetalink-0.1.3/+download/libmetalink-0.1.3.tar.xz
# md5 f2c097557e2487313cd0be62d55952de
{% endblock %}

{% block lib_deps %}
lib/expat/mix.sh
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}

{% block coflags %}
--with-libexpat=yes
{% endblock %}
