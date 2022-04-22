from adb_interface import *

# input flag into text box and have cursor start at the beginning
# program will then iterate through and solve for each letter.

for i in range(23):
    cursor_right()
    tab()
    press_enter()
    
    patter = f"UseForce: {i}:".encode()
    
    line = get_line(patter)
    
    if get_index_state(line) != 1:
        for j in range(len(flag_chars)):
            delete_char()
            put_text(flag_chars[j])
            
            tab()
            press_enter()
            press_enter()
            
            line = get_line(patter)
            
            if get_index_state(line) == 1:
                break
            