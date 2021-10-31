{% extends '//dev/lang/sbcl/boot/mix.sh' %}

{% block more_deps %}
# bld dev/lang/sbcl/boot/mix.sh
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}
