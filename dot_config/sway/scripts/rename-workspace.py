#!/usr/bin/env python3

from pathlib import Path
import subprocess


def main() -> None:

    cache_dir = Path("~/.cache/sway-workspaces").expanduser()
    cache = cache_dir / Path("names.txt")

    cache_dir.mkdir(exist_ok=True)
    cache.touch(exist_ok=True)

    names = cache.read_text()
    selection = rofi(names)

    if not selection.strip():
        exit(1)

    rename(selection)
    names = f"{selection}" + names

    names = remove_duplicates(names)

    cache.write_text(names)


def rofi(names: str) -> str:
    selection = subprocess.run(["rofi", "-dmenu", "-p", "New name:"],
                               input=names, text=True, capture_output=True)

    return selection.stdout


def rename(name: str) -> None:
    subprocess.run(["swaymsg", "rename", "workspace", "to", name])


def remove_duplicates(names: str, limit: int = 50) -> str:
    name_list = names.split("\n")
    names_mem: set[str] = set()

    reduced_names: list[str] = []
    for el in name_list:
        if el in names_mem:
            continue

        reduced_names.append(el)
        names_mem.add(el)

    return "\n".join(reduced_names[:limit])


if __name__ == "__main__":
    main()
