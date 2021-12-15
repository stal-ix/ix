{% extends '//dev/lang/sbcl/boot/mix.sh' %}

{% block boot_lisp_dep %}
dev/lang/sbcl/bin/mix.sh
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}
