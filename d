diff --git a/core/manager.py b/core/manager.py
index 090e1d2..7c2dbde 100644
--- a/core/manager.py
+++ b/core/manager.py
@@ -38,26 +38,30 @@ class Manager:
             except KeyError:
                 self._p[key] = cp.Package(selector, self)
 
-    def iter_packages(self, selectors):
-        def iter_deps():
-            for sel in selectors:
-                yield sel
-                yield from self.load_package(sel).all_depends()
-
-        for d in cu.iter_uniq_list(iter_deps()):
-            yield self.load_package(d)
+    def load_packages(self, ss):
+        for s in ss:
+            yield self.load_package(s)
 
     def iter_runtime_packages(self, selectors):
         def iter_deps():
-            for sel in selectors:
-                yield sel
-                yield from self.load_package(sel).all_runtime_depends()
+            for p in self.load_packages(selectors):
+                yield p
+                yield from p.iter_all_runtime_depends()
+
+        s = set()
 
-        for d in cu.iter_uniq_list(iter_deps()):
-            yield self.load_package(d)
+        for p in iter_deps():
+            if p.uid not in s:
+                s.add(p.uid)
+
+                yield p
 
     def iter_build_commands(self, selectors):
-        for pkg in self.iter_packages(selectors):
+        list(self.load_packages(selectors))
+
+        for pkg in self._p.values():
+            print(pkg.name, pkg.uid, pkg.buildable())
+
             try:
                 yield from pkg.commands()
             except Exception as e:
diff --git a/core/package.py b/core/package.py
index 7886575..e9cf6fe 100644
--- a/core/package.py
+++ b/core/package.py
@@ -1,5 +1,6 @@
 import os
 import sys
+import json
 import jinja2
 import itertools
 import multiprocessing
@@ -37,9 +38,34 @@ def parse_pkg_name(v):
     return r
 
 
+def make_selector(v, flags):
+    v = parse_pkg_name(v)
+
+    v['flags'] = dict(itertools.chain(flags.items(), v.get('flags', {}).items()))
+
+    return v
+
+
+def uniq_pkgs(l):
+    s = set()
+
+    for x in l:
+        if x.uid not in s:
+            s.add(x.uid)
+
+            yield x
+
+
+def buildable(l):
+    for x in l:
+        if x.buildable():
+            yield x
+
+
 class Package:
     def __init__(self, selector, mngr):
         print(selector)
+
         self.selector = selector
         self.manager = mngr
         self.descr = cr.RenderContext(self).render()
@@ -67,9 +93,18 @@ class Package:
     def config(self):
         return self.manager.config
 
-    def load_package(self, selector):
-        # print(self.name, selector)
+    def load_package(self, n):
+        try:
+            n['name']
+        except TypeError:
+            if n.startswith('lib/'):
+                n = make_selector(n, self.flags)
+            else:
+                n = make_selector(n, {})
+
+        return self.load_package_impl(n)
 
+    def load_package_impl(self, selector):
         try:
             return self.manager.load_package(selector)
         except FileNotFoundError:
@@ -78,76 +113,97 @@ class Package:
 
             raise ce.Error(f'can not load dependant package {s1} of {s2}')
 
-    def filter_buildable(self, it):
-        for n in it:
-            if self.load_package(n).buildable():
-                yield n
+    def load_packages(self, l):
+        return [self.load_package(x) for x in l]
 
-    def make_selector(self, v):
-        try:
-            v['name']
-        except Exception:
-            v = parse_pkg_name(v)
+    def bld_deps(self):
+        return self.descr['bld']['deps']
 
-        if 'flags' not in v:
-            v['flags'] = {}
+    def lib_deps(self):
+        return self.descr['lib']['deps']
 
-        if v['name'].startswith('lib/'):
-            v['flags'] = dict(itertools.chain(self.flags.items(), v['flags'].items()))
+    def run_deps(self):
+        return self.descr['run']['deps']
 
-        return v
+    def bld_lib_deps(self):
+        yield from self.lib_deps()
 
-    def make_selectors(self, lst):
-        return [self.make_selector(x) for x in lst]
+        for x in self.bld_deps():
+            if x.startswith('lib/'):
+                yield x
 
-    # build
-    def build_depends(self):
-        return self.make_selectors(self.descr['lib']['deps'] + self.descr['bld']['deps'])
+        for p in self.bld_bin_closure():
+            for x in p.lib_deps():
+                yield x
+
+            for x in p.run_deps():
+                if x.startswith('lib/'):
+                    yield x
+
+    def bld_bin_deps(self):
+        for x in self.bld_deps():
+            if not x.startswith('lib/'):
+                yield x
 
     @cu.cached_method
-    def all_build_depends(self):
-        def iter_deps():
-            yield from self.build_depends()
+    def bld_bin_closure(self):
+        def it():
+            l = self.load_packages(self.bld_bin_deps())
 
-            for d in self.build_depends():
-                yield from self.load_package(d).all_runtime_depends()
+            yield from l
 
-        return cu.uniq_list(self.filter_buildable(iter_deps()))
+            for p in l:
+                yield from p.run_closure()
 
-    def iter_all_build_depends(self):
-        for d in self.all_build_depends():
-            yield self.load_package(d)
+        return list(uniq_pkgs(it()))
+
+    @cu.cached_method
+    def lib_closure(self):
+        def it():
+            l = self.load_packages(self.lib_deps())
+
+            yield from l
+
+            for p in l:
+                yield from p.lib_closure()
 
-    # runtime
-    def runtime_depends(self):
-        return self.make_selectors(self.descr['lib']['deps'] + self.descr['run']['deps'])
+        return list(uniq_pkgs(it()))
 
     @cu.cached_method
-    def all_runtime_depends(self):
-        def iter_deps():
-            yield from self.runtime_depends()
+    def bld_lib_closure(self):
+        def it():
+            l = self.load_packages(self.bld_lib_deps())
 
-            for d in self.runtime_depends():
-                yield from self.load_package(d).all_runtime_depends()
+            yield from l
 
-        return cu.uniq_list(self.filter_buildable(iter_deps()))
+            for p in l:
+                yield from p.lib_closure()
 
-    def iter_all_runtime_depends(self):
-        for d in self.all_runtime_depends():
-            yield self.load_package(d)
+        return list(uniq_pkgs(it()))
+
+    def iter_all_build_depends(self):
+        yield from buildable(self.bld_bin_closure())
+        yield from buildable(self.bld_lib_closure())
 
-    # all
-    def depends(self):
-        return self.build_depends() + self.runtime_depends()
+    def run_run_deps(self):
+        for x in self.run_deps():
+            if not x.startswith('lib/'):
+                yield x
 
     @cu.cached_method
-    def all_depends(self):
-        def iter_deps():
-            for d in self.depends():
-                yield d
-                yield from self.load_package(d).all_depends()
+    def run_closure(self):
+        def it():
+            l = self.load_packages(self.run_run_deps())
+
+            yield from l
 
-        return cu.uniq_list(iter_deps())
+            for p in l:
+                yield from p.run_closure()
+
+        return list(uniq_pkgs(it()))
+
+    def iter_all_runtime_depends(self):
+        yield from buildable(self.run_closure())
 
     def commands(self):
         return list(cg.iter_build_commands(self))
diff --git a/pkgs/env/os/mix.sh b/pkgs/env/os/mix.sh
index f42d917..3d26331 100644
--- a/pkgs/env/os/mix.sh
+++ b/pkgs/env/os/mix.sh
@@ -1,6 +1,6 @@
-{% extends '//mix/template/hub.sh' %}
+{% extends '//mix/template/mix.json' %}
 
-{% block deps %}
+{% block lib_deps %}
 env/release/mix.sh
 env/os/{{mix.platform.target.os}}/mix.sh
 {% endblock %}
