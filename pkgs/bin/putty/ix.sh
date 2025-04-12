{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.76
{% endblock %}

{% block fetch %}
https://the.earth.li/~sgtatham/putty/{{self.version().strip()}}/putty-{{self.version().strip()}}.tar.gz
sha:547cd97a8daa87ef71037fab0773bceb54a8abccb2f825a49ef8eba5e045713f
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
{% endblock %}

{% block configure_flags %}
--help
{% endblock %}
