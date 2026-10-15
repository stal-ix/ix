{# Cython, for building a CPython whose stdlib is native code.

   Carries two fixes.

   SliceIndexNode.inferable_item_node hands its base a not_a_constant
   index when it cannot work out the offset it slices from, and the
   base implementation feeds that straight to IntNode.for_size, which
   asserts it got an int. The compiler crashes in
   MarkParallelAssignments on re._compiler, tkinter.ttk and
   zoneinfo._zoneinfo. There is nothing to infer about an item at an
   unknown position, and both callers already take None for that.

   Iterating a bytes literal yields bytes of length one rather than
   ints -- Python 2's semantics, in a language_level=3 compile. re's
   _special_chars_map is built by exactly that, so chr() gets a bytes
   and the module will not import. Cython's own comment in
   _transform_bytes_iteration says which answer belongs to which
   Python; the literal fast path above it does not ask. Taking bytes
   literals off that path costs an optimisation nobody needs and
   leaves the generic iteration, which is right. #}

{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
cython
{% endblock %}

{% block version %}
3.3.0
{% endblock %}

{% block fetch %}
https://files.pythonhosted.org/packages/bf/77/67b0b24e45073a699610e50f00c18474ff9b09ea29ecc95083bdf5e60acd/cython-{{self.version().strip()}}-py3-none-any.whl
9b24b5c8cd536946b62086fcafee6d5509d3f549f72d553d2336af87ffbe0da1
{% endblock %}

{% block run_deps %}
bld/python
{% endblock %}

{# a wheel is flat; there is no leading directory to strip #}
{% block skip_dirs %}0{% endblock %}

{% block patch %}
sed -e 's|^\( *\)return IndexNode(self.pos, base=self, index=IntNode.for_size(self.pos, index))|\1if index is not_a_constant:\n\1    return None\n&|' \
    -i Cython/Compiler/ExprNodes.py
grep -n -A2 'if index is not_a_constant' Cython/Compiler/ExprNodes.py | head -6

sed -e 's|^\( *\)if iterable.is_string_literal:|\1if iterable.is_string_literal and not iterable.type.is_pybytes_type:|' \
    -e 's|^\( *\)if not target_type.is_int and not target_type.is_pybytes_type:|\1if not target_type.is_int:|' \
    -i Cython/Compiler/Optimize.py
grep -n 'is_string_literal and not\|if not target_type.is_int:' Cython/Compiler/Optimize.py
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/bin
cp -R Cython pyximport cython.py ${out}/lib/

base64 -d << IX_DRIVER > ${out}/bin/ix_cythonize
{% include 'cythonize.py/base64' %}
IX_DRIVER

chmod +x ${out}/bin/ix_cythonize
{% endblock %}

{% block postinstall %}
: a wheel is already laid out the way it is used
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{# a consumer that also depends on a python library gets that library's
   stdlib on PYTHONPATH too, and mixing two stdlibs kills the
   interpreter at startup. This names the one directory ix_cythonize
   actually needs, so it can be run with nothing else on the path. #}
export IX_CYTHON_PATH="${out}/lib"
{% endblock %}
