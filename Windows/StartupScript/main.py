import win32com.client
import win32gui
import win32con
import os
import subprocess
import time

SEARCH_PATH1 = os.path.join(os.environ['ProgramData'], 'Microsoft', 'Windows', 'Start Menu')
SEARCH_PATH2 = os.path.join(os.environ['APPDATA'], 'Microsoft', 'Windows', 'Start Menu')

def check_for_lnk(program):
    lnk = f"{program}.lnk"
    
    for search_path in [SEARCH_PATH1, SEARCH_PATH2]:
        for root, dirs, files in os.walk(search_path):
            if lnk in files:
                return os.path.join(root, lnk)
    
    return None

def get_target_executable_from_shortcut(shortcut_path):
    shell = win32com.client.Dispatch("WScript.Shell")
    shortcut = shell.CreateShortCut(shortcut_path)
    return shortcut.Targetpath

def find_window_handle_by_title(title):
    def callback(hwnd, window_list):
        if win32gui.IsWindowVisible(hwnd) and title in win32gui.GetWindowText(hwnd):
            window_list.append(hwnd)
        return True

    window_list = []
    win32gui.EnumWindows(callback, window_list)
    return window_list

def move_and_resize_window_by_title(window_title, x, y, width, height):
    window_handle = None
    start_time = time.time()

    # Wait until the window is found or 10 seconds pass
    while not window_handle and time.time() - start_time < 10:
        window_handles = find_window_handle_by_title(window_title)
        if window_handles:
            window_handle = window_handles[0]
            win32gui.MoveWindow(window_handle, x, y, width, height, True)
        else:
            time.sleep(0.5)

    if not window_handle:
        print("Window not found.")
        
def maximize_window_by_title(window_title):
    window_handles = find_window_handle_by_title(window_title)
    if window_handles:
        window_handle = window_handles[0]
        win32gui.ShowWindow(window_handle, win32con.SW_MAXIMIZE)
    else:
        print("Window not found.")

lwpath = check_for_lnk("LibreWolf")
if lwpath is not None:
    lw_executable = get_target_executable_from_shortcut(lwpath)
    subprocess.Popen([lw_executable, '--new-window', 'https://music.youtube.com/'])
    move_and_resize_window_by_title("YouTube Music — LibreWolf", -1088, 681, 1092, 632)
    subprocess.Popen([lw_executable, '--new-window', 'https://messenger.com/'])
    move_and_resize_window_by_title("Messenger — LibreWolf", -1087, -18, 1094, 704)
    subprocess.Popen([lw_executable, '--new-window', 'https://discord.com/channels/@me'])
    move_and_resize_window_by_title("Discord — LibreWolf", -1086, -562, 1092, 552)
    subprocess.Popen([lw_executable])
    move_and_resize_window_by_title("Strona Główna — LibreWolf", 0, 0, 500, 500)
    maximize_window_by_title("Strona Główna — LibreWolf")
else:
    print("LibreWolf shortcut not found.")