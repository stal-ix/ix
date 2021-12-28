{% extends '//dev/lang/sbcl/boot/mix.sh' %}

{% block boot_lisp_dep %}
dev/lang/sbcl/bin
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}
