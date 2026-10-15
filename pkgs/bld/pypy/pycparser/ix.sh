{# rpython/tool/cparser needs pycparser, and it runs under Python 2.

   pip/pycparser pins 2.22, whose precomputed ply lextab has more than
   100 named groups — python2's sre refuses to compile it, so the
   parser blows up on construction. 2.21 is the last release that still
   ships a py2 wheel, and it parses fine. #}

{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
pycparser
{% endblock %}

{% block version %}
2.21
{% endblock %}

{% block fetch %}
https://files.pythonhosted.org/packages/62/d5/5f610ebe421e85889f2e55e33b7f9a6795bd982198517d912eb1c76e1a53/pycparser-{{self.version().strip()}}-py2.py3-none-any.whl
8ee45429555515e1f6b185e78100aea234072576aa43ab53aefcae078162fca9
{% endblock %}

{% block unpack %}
mkdir -p ${out}/lib
cd ${out}/lib
extract0 ${src}/*.whl
{% endblock %}

{% block postinstall %}
: a wheel is already laid out the way it is used
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
