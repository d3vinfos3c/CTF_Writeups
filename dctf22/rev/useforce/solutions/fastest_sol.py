from adb_interface import *

flag = list("dctf{" + "A"*17 + "}")

bad = []
bad_states = {}

for i in range(5, 22):
    bad.append(i)
    bad_states[i] = 0

changed = 1

while len(bad) != 0:
    
    print(f"Bad: {bad}")
    
    if changed != 0:
        for b in bad:
            flag[b] = flag_chars[bad_states[b]]
            
        put_text("".join(flag))
        tab()
        
    press_enter()
    
    changed = 0
    
    logs = get_new_log()

    for b in bad:
        patter = f"UseForce: {b}:".encode()
        
        for l in logs:
            if patter in l:
                if get_index_state(l) == 1:
                    bad.remove(b)
                else:
                    changed = 1
                    bad_states[b] += 1
    
    if changed != 0:
        tab()   
        tab()  
        clear()
    
print(flag)