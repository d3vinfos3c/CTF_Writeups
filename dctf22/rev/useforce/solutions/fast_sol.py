from adb_interface import *
import time
import copy

flag = list("dctf{" + "A"*17 + "}")

bad = []

for i in range(5, 22):
    bad.append(i)

fci= 0

while len(bad) != 0:
    
    print(f"Bad: {bad}")
    
    for b in bad:
        flag[b] = flag_chars[fci]
        
    put_text("".join(flag))

    to_check = copy.deepcopy(bad)

    tab()

    while len(to_check) != 0:
        press_enter()
        
        logs = get_new_log()
        
        print(f"to_check: {to_check}")

        for t in to_check:
            patter = f"UseForce: {t}:".encode()
            
            for l in logs:
                if patter in l:
                    if get_index_state(l) == 1:
                        bad.remove(t)
                    to_check.remove(t)
    tab()   
    tab()  
    clear()
    fci += 1
    
print(flag)