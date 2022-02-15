{% extends '//bin/sbcl/boot/mix.sh' %}

{% block boot_lisp_dep %}
bin/sbcl/boot
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}
