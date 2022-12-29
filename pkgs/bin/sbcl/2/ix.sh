{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.2.2/sbcl-2.2.2-source.tar.bz2
sha:8790dbbe97711dce14bb823125ce5b185b0073cf2f3cbf37bdd1ad380e7950f6
{% endblock %}

{% block bld_tool %}
bld/sbcl
{{super()}}
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}

{% block extern_symbols %}
{{super()}}
{% include 'nnn' %}
{% endblock %}
