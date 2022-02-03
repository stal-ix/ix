{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://the.earth.li/~sgtatham/putty/latest/putty-0.76.tar.gz
sha:547cd97a8daa87ef71037fab0773bceb54a8abccb2f825a49ef8eba5e045713f
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
{% endblock %}

{% block configure_flags %}
--help
{% endblock %}
