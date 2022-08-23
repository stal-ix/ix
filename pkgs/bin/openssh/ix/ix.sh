{% extends '//bin/openssh/t/ix.sh'%}

{% block configure_flags %}
{{super()}}
--with-privsep-path=/
--with-privsep-user=root
{% endblock %}
