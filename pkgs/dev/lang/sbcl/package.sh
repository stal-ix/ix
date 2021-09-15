{% extends '//dev/lang/sbcl/boot/package.sh' %}

{% block more_deps %}
# bld dev/lang/sbcl/boot
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}
