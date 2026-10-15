{# Host CPython 2 for the RPython translator.

   rpython imports ctypes on the way in: rlib/rthread casts through
   ll2ctypes, whose _setup_ctypes_cache() reaches straight for
   ctypes.c_long. The stock bld/python/2 has no _ctypes, so the
   translation dies before it starts. Everything else it needs is
   already there. #}

{% extends '//bld/python/2/ix.sh' %}

{% block pkg_name %}
python2-pypy
{% endblock %}

{# ll2ctypes resolves translation-time external calls with ctypes. In a
   static world CDLL of a freshly built .so cannot work, so the symbols
   have to be reachable through the process-wide dl table instead:
   wrap_rdynamic registers everything this binary links. #}
{% block build_flags %}
{{super()}}
wrap_cc
wrap_rdynamic
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/ffi
{# what ll2ctypes has to be able to resolve at translation time: libc
   for most rffi externals, the RPython runtime's own C for the ones
   the untranslated interpreter calls, and the libraries named in the
   ecis of the modules whose space initialisation touches them #}
lib/c/dl
lib/z/dl
lib/pypy/syms/dl
{% endblock %}

{% block patch %}
{{super()}}
cat << EOF >> Modules/Setup.local
_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c
EOF
{% endblock %}
