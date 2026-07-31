import json
import os
import shlex
import shutil
import subprocess
import sys
from string import Template


def die(msg):
    print(msg, file=sys.stderr)
    raise SystemExit(1)


def as_list(value):
    if value is None:
        return []
    if isinstance(value, list):
        return value
    return [value]


def merge(base, extra):
    if isinstance(base, dict) and isinstance(extra, dict):
        out = dict(base)
        for key, value in extra.items():
            if key in out:
                out[key] = merge(out[key], value)
            else:
                out[key] = value
        return out

    if isinstance(base, list) and isinstance(extra, list):
        return base + extra

    return extra


def resolve_exec(path, env=None):
    if "/" in path:
        return os.path.abspath(path)

    if found := shutil.which(path, path=(env or os.environ).get("PATH")):
        return found

    die(f"wrap: no executable for {path}")


def find_settings():
    cur = os.path.abspath(os.getcwd())

    while True:
        path = os.path.join(cur, "settings.json")
        if os.path.isfile(path):
            return path

        parent = os.path.dirname(cur)
        if parent == cur:
            return None

        cur = parent


def load_json(path):
    try:
        with open(path, "r", encoding="utf-8") as fh:
            return json.load(fh)
    except Exception as exc:
        die(f"wrap: failed to load {path}: {exc}")


def expand_cfg_vars(value, env):
    if isinstance(value, dict):
        return {key: expand_cfg_vars(item, env) for key, item in value.items()}

    if isinstance(value, list):
        return [expand_cfg_vars(item, env) for item in value]

    if isinstance(value, str):
        return Template(value).safe_substitute(env)

    return value


def binary_cfg(root, name):
    out = {}

    binaries = root.get("binaries")
    if isinstance(binaries, dict) and name in binaries:
        out = merge(out, binaries[name])

    if name in root and isinstance(root[name], dict):
        out = merge(out, root[name])

    return out


def split_root_cfg(root):
    common = {}
    binaries = {}

    for key, value in root.items():
        if key in ("common", "binaries"):
            continue

        if key.endswith(".exe") and isinstance(value, dict):
            binaries[key] = value
        else:
            common[key] = value

    return common, binaries


def load_cfg(name):
    path = find_settings()
    if not path:
        return None, {}

    data = load_json(path)
    root = data.get("wrap", data)
    if not isinstance(root, dict):
        die(f"wrap: {path}: top-level wrap config must be an object")

    if "common" in root or "binaries" in root:
        common = root.get("common", {})
        if common is None:
            common = {}
        if not isinstance(common, dict):
            die(f"wrap: {path}: common config must be an object")

        specific = binary_cfg(root, name)
    else:
        common, binaries = split_root_cfg(root)
        specific = binaries.get(name, {})

    if specific is None:
        specific = {}
    if not isinstance(specific, dict):
        die(f"wrap: {path}: config for {name} must be an object")

    return path, expand_cfg_vars(merge(common, specific), os.environ)


def source_env(env, files):
    files = [str(x) for x in as_list(files)]
    if not files:
        return env

    script = []
    for path in files:
        script.append(". " + shlex.quote(path))
    script.append("env -0")

    try:
        out = subprocess.check_output(
            ["sh", "-c", "\n".join(script)],
            env=env,
        )
    except subprocess.CalledProcessError as exc:
        die(f"wrap: failed to source env: {exc}")

    new_env = {}
    for item in out.split(b"\0"):
        if not item:
            continue
        key, sep, value = item.partition(b"=")
        if not sep:
            continue
        new_env[os.fsdecode(key)] = os.fsdecode(value)

    return new_env


def build_env(cfg):
    env = dict(os.environ)

    for key, value in cfg.get("env", {}).items():
        if value is None:
            env.pop(key, None)
        else:
            env[str(key)] = str(value)

    path = env.get("PATH", "")
    pre = [str(x) for x in as_list(cfg.get("path_prepend"))]
    post = [str(x) for x in as_list(cfg.get("path_append"))]

    parts = []
    parts.extend(x for x in pre if x)
    if path:
        parts.append(path)
    parts.extend(x for x in post if x)

    if parts:
        env["PATH"] = os.pathsep.join(parts)

    return source_env(env, cfg.get("source"))


def enabled(cfg):
    if cfg is None or cfg is False:
        return False

    if cfg is True:
        return True

    if isinstance(cfg, dict):
        return cfg.get("enabled", True)

    return bool(cfg)


def cfg_bin(cfg, default_name, env):
    if cfg is True:
        return resolve_exec(default_name, env)
    if isinstance(cfg, dict):
        return resolve_exec(str(cfg.get("bin", default_name)), env)
    return resolve_exec(default_name, env)


def build_subreaper(cfg, env):
    if not enabled(cfg):
        return []

    cmd = [cfg_bin(cfg, "subreaper", env)]
    if isinstance(cfg, dict):
        cmd.extend(str(x) for x in as_list(cfg.get("args")))
    return cmd


def build_wirez(cfg, env):
    if not enabled(cfg):
        return []

    cmd = [cfg_bin(cfg, "wirez", env)]
    if cfg is True:
        cmd.append("-q")
        return cmd

    if cfg.get("quiet", True):
        cmd.append("-q")

    for value in as_list(cfg.get("forward")):
        cmd.extend(["-F", str(value)])

    for value in as_list(cfg.get("listen")):
        cmd.extend(["-L", str(value)])

    for value in as_list(cfg.get("bypass")):
        cmd.extend(["-B", str(value)])

    cmd.extend(str(x) for x in as_list(cfg.get("args")))
    return cmd


def build_jail(cfg, env):
    if not enabled(cfg):
        return []

    cmd = [cfg_bin(cfg, "jail", env)]
    if cfg is True:
        return cmd

    for value in as_list(cfg.get("rw")):
        cmd.append("--rw=" + str(value))

    for value in as_list(cfg.get("ro")):
        cmd.append("--ro=" + str(value))

    cmd.extend(str(x) for x in as_list(cfg.get("args")))
    return cmd


def build_target(exec_path, cfg, argv):
    cmd = [exec_path]
    cmd.extend(str(x) for x in as_list(cfg.get("args_prepend")))
    cmd.extend(argv)
    cmd.extend(str(x) for x in as_list(cfg.get("args_append")))
    return cmd


def wirez_cfg(cfg):
    if "wirez" in cfg:
        return cfg.get("wirez")

    keys = ("quiet", "forward", "listen", "bypass")
    if any(key in cfg for key in keys):
        return {key: cfg[key] for key in keys if key in cfg}

    return None


def jail_cfg(cfg):
    if "jail" in cfg:
        return cfg.get("jail")

    keys = ("rw", "ro")
    if any(key in cfg for key in keys):
        return {key: cfg[key] for key in keys if key in cfg}

    return None


def subreaper_cfg(cfg):
    if "subreaper" in cfg:
        return cfg.get("subreaper")

    return True


def parse_argv(argv):
    rest = list(argv)
    if not rest:
        die("usage: wrap wrapped -- args")

    target = rest[0]
    rest = rest[1:]

    if rest and rest[0] == "--":
        rest = rest[1:]

    return target, rest


def main():
    target, argv = parse_argv(sys.argv[1:])
    name = os.path.basename(target)

    settings_path, cfg = load_cfg(name)
    env = build_env(cfg)
    exec_path = resolve_exec(target, env)
    cmd = build_target(exec_path, cfg, argv)

    jail = jail_cfg(cfg)
    if enabled(jail):
        cmd = build_jail(jail, env) + ["--"] + cmd

    wirez = wirez_cfg(cfg)
    if enabled(wirez):
        cmd = build_wirez(wirez, env) + ["--"] + cmd

    subreaper = subreaper_cfg(cfg)
    if enabled(subreaper):
        cmd = build_subreaper(subreaper, env) + cmd

    if cfg.get("debug") or env.get("WRAP_DEBUG") == "1":
        if settings_path:
            print(f"wrap: settings={settings_path}", file=sys.stderr)
        print("wrap: exec " + shlex.join(cmd), file=sys.stderr)

    os.execvpe(cmd[0], cmd, env)


if __name__ == "__main__":
    main()
