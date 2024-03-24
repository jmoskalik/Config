import subprocess
import win32gui
import time
chrome_exe = r'C:\\Users\\Jakub Moskalik\\AppData\\Local\\Chromium\\Application\\chrome.exe'

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
        print(f"{window_title} not found.")

commands = [
    f'start "" "{chrome_exe}" --app=https://messenger.com/ --window-size=1080,640 --window-position=-1080,95',
    f'start "" "{chrome_exe}" --app=https://discord.com/channels/@me --window-size=1080,640 --window-position=-1080,540',
    f'start "" "{chrome_exe}" --app=https://music.youtube.com/ --window-size=1080,600 --window-position=-1080,985'
]

# Execute the commands
for command in commands:
    subprocess.Popen(command, shell=True)
move_and_resize_window_by_title("Discord", -1080,-500,1080,640)    
move_and_resize_window_by_title("Messenger", -1080,137,1080,640)
move_and_resize_window_by_title("YouTube Music", -1080, 775,1080,600)