import subprocess
import json

FORMAT = "({workspace}) {app_id}: {name}"
MAX_LENGTH = 40
ELLIPSIS = "..."


def main():
    proc = subprocess.run(["/home/ld/.go/bin/lof", "-action",
                          "get_windows"], capture_output=True, text=True)
    windows_list = json.loads(proc.stdout)
    windows_dict = {}
    for el in windows_list:
        if el["focused"]:
            continue
        name = el["name"] if len(
            el["name"]) <= MAX_LENGTH else el["name"][:MAX_LENGTH-len(ELLIPSIS)]+ELLIPSIS
        id = FORMAT.format(app_id=el["app_id"],
                           name=name, workspace=el["workspace"])
        windows_dict[id] = el["id"]

    selection = subprocess.run(["rofi", "-dmenu",
                                "-p", "Select window to jump to:"],
                               input="\n".join(list(windows_dict.keys())),
                               text=True, capture_output=True)

    selected_window = selection.stdout
    if selected_window == "":
        return

    win_id = windows_dict.get(selected_window.rstrip(), -1)
    if win_id == -1:
        subprocess.run(["/home/ld/.go/bin/lof", "-action",
                       "launch", "-cmd", selected_window])
        return

    subprocess.run(["/home/ld/.go/bin/lof", "-action",
                    "focus", "-criteria", "con_id", "-identifier", str(win_id)])


if __name__ == "__main__":
    main()
