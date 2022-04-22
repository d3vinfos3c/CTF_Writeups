from pwn import *

flag_chars = list("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-")

def get_line(search_patter):
            
    for d in get_useforce_logs():
        if search_patter in d:
            tab()
            tab()
            return d
    
    press_enter()
    return get_line(search_patter)

def get_useforce_logs():
    data = adb.logcat()
    
    new_data = data.split(b"\n")[-1000:]
    
    new_new = []
    
    for n in new_data:
        if b"UseForce:" in n:
            new_new.append(n)
            
    return new_new[-15:]

def get_new_log():
    data = adb.logcat()
    
    new_data = data.split(b"\n")[-1000:]
    
    new_new = []
    
    for n in new_data:
        if b"UseForce:" in n:
            new_new.append(n)
            
    new_time = new_new[-1].split()[1]
    
    actual = []
    
    for n in new_new:
        if n.split()[1] == new_time:
            actual.append(n)
            
    return actual

def get_logs(pid):
    return adb.process(["logcat", f"--pid={pid}"]).recvall()

def delete_char():
    adb.adb(["shell", "input", "keyevent",  "KEYCODE_DEL"])
    
def clear():
    tab()
    tab()
    press_enter()
    tab()
    
def tab():
    adb.adb(["shell", "input", "keyevent", "KEYCODE_TAB"])
    
def put_text(text):
    adb.adb(["shell", "input", "keyboard", "text", f"{text}"])
    
def press_enter():
    adb.adb(["shell", "input", "keyevent", "KEYCODE_ENTER"])

def cursor_right():
    adb.adb(["shell", "input", "keyevent", "KEYCODE_DPAD_RIGHT"])
    
def get_index_state(line):
    return int(line.split()[-1].decode())