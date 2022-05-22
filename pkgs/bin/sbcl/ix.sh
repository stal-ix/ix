{% extends '//bin/sbcl/boot/ix.sh' %}

{% block boot_lisp_dep %}
bin/sbcl/boot
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}
