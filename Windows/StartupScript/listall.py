import win32gui

def list_windows():
    def callback(hwnd, windows):
        if win32gui.IsWindowVisible(hwnd):
            windows.append((hwnd, win32gui.GetWindowText(hwnd)))
        return True

    windows = []
    win32gui.EnumWindows(callback, windows)
    return windows

# Example usage
if __name__ == "__main__":
    windows = list_windows()
    for hwnd, title in windows:
        print(f"Window handle: {hwnd}, Title: {title}")