/* BCST - Introduction to Computer Systems
 * Author:      yangminz@outlook.com
 * Github:      https://github.com/yangminz/bcst_csapp
 * Bilibili:    https://space.bilibili.com/4564101
 * Zhihu:       https://www.zhihu.com/people/zhao-yang-min
 * This project (code repository and videos) is exclusively owned by yangminz
 * and shall not be used for commercial and profitting purpose
 * without yangminz's permission.
 */

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>

int heap_init();
uint64_t mem_alloc(uint32_t size);
void mem_free(uint64_t vaddr);

uint64_t heap_start_vaddr = 0;
uint64_t heap_end_vaddr = 0;

#define HEAP_MAX_SIZE (4096 * 8)
uint8_t heap[HEAP_MAX_SIZE];

typedef struct
{
    /* data */
} block_t;

// Round up to next multiple of n:
// if (x == k * n)
// return x
// else, x = k * n + m and m < n
// return (k + 1) * n
static uint64_t round_up(uint64_t x, uint64_t n)
{
    return n * ((x + n - 1) / n);
}

// applicapable for both header and footer
static uint32_t get_blocksize(uint64_t header_vaddr)
{
    assert(heap_start_vaddr <= header_vaddr && header_vaddr <= heap_end_vaddr);
    assert((header_vaddr & 0x3) == 0x0); // 4 bytes alignment
    uint32_t header_value = *(uint32_t *)&heap[header_vaddr];
    return header_value & 0xFFFFFFF8;
}

static void set_blocksize(uint64_t header_vaddr, uint32_t blocksize)
{
    assert(heap_start_vaddr <= header_vaddr && header_vaddr <= heap_end_vaddr);
    assert((header_vaddr & 0x3) == 0x0); // 4 bytes alignment
    assert((blocksize & 0x7) == 0x0);    // blocksize should be 8 bytes aligned
    *(uint32_t *)&heap[header_vaddr] &= 0x00000007;
    *(uint32_t *)&heap[header_vaddr] |= blocksize;
}

// applicapable for both header and footer
static uint32_t get_allocated(uint64_t header_vaddr)
{
    assert(heap_start_vaddr <= header_vaddr && header_vaddr <= heap_end_vaddr);
    assert((header_vaddr & 0x3) == 0x0); // 4 bytes alignment
    uint32_t header_value = *(uint32_t *)&heap[header_vaddr];
    return header_value & 0x1;
}

static void set_allocated(uint64_t header_vaddr, uint32_t allocated)
{
    assert(heap_start_vaddr <= header_vaddr && header_vaddr <= heap_end_vaddr);
    assert((header_vaddr & 0x3) == 0x0); // 4 bytes alignment
    *(uint32_t *)&heap[header_vaddr] &= 0xFFFFFF8;
    *(uint32_t *)&heap[header_vaddr] |= (allocated & 0x1);
}

static uint64_t get_payloadaddr(uint64_t vaddr)
{
    // vaddr can be:
    // 1. starting address of block (8 * (n - 1) + 4)
    // 2. starting address of the payload (8 * n)
    return round_up(vaddr, 8);
}

static uint64_t get_blockheader(uint64_t vaddr)
{
    // vaddr can be:
    // 1. starting address of block (8 * (n - 1) + 4)
    // 2. starting address of the payload (8 * n)
    return round_up(vaddr, 8) - 4;
}

static uint64_t get_nextheader(uint64_t vaddr)
{
    // vaddr can be:
    // 1. starting address of block (8 * (n - 1) + 4)
    // 2. starting address of the payload (8 * n)
    uint64_t header_vaddr = get_blockheader(vaddr);
    uint32_t block_size = get_blocksize(header_vaddr);
    uint64_t next_header_vaddr = header_vaddr + block_size;
    assert(heap_start_vaddr <= next_header_vaddr &&
           next_header_vaddr <= heap_end_vaddr);
    return next_header_vaddr;
}

static uint64_t get_prevheader(uint64_t vaddr)
{
    // vaddr can be:
    // 1. starting address of block (8 * (n - 1) + 4)
    // 2. starting address of the payload (8 * n)
    uint64_t header_vaddr = get_blockheader(vaddr);
    assert(header_vaddr >= 16);

    uint64_t prev_footer_vaddr = header_vaddr - 4;
    uint32_t prev_blocksize = get_blocksize(prev_footer_vaddr);

    uint64_t prev_header_vaddr = header_vaddr - prev_blocksize;
    assert(heap_start_vaddr <= prev_header_vaddr &&
           prev_header_vaddr <= heap_end_vaddr - 12);
    return prev_header_vaddr;
}

static uint32_t is_lastblock(uint64_t vaddr)
{
    return 0;
}

static uint32_t check_block(uint64_t vaddr)
{
    return 0;
}

int heap_check()
{
    // rule 1: block[0] ==> A/F
    // rule 2: block[-1] ==> A/F
    // rule 3: block[i] == A ==> block[i-1] == A/F && block[i+1] == A/F
    // rule 4: block[i] == F ==> block[i-1] == A && block[i+1] = A
    // these 4 rules ensure that free blocks are always at its merged together
    // henceforth external fragmentation are minimized
    return 0;
}

int heap_init()
{
    // heap_start_vaddr is the starting address of the first block
    // the payload of first block is 8B aligned([8])
    // so the header address of the first block is [8] - 4 = [4]
    heap_start_vaddr = 4;

    set_blocksize(heap_start_vaddr, 4096 - 8);
    set_allocated(heap_start_vaddr, 0);

    // we do not set footer for the last block in heap
    heap_end_vaddr = 4096 - 1;

    return 0;
}

// size - request payload size
// return - the virtual address of payload
uint64_t mem_alloc(uint32_t size)
{
    assert(0 < size && size < 4096 - 8);

    uint32_t request_blocksize = round_up(size, 8) + 4 + 4;

    uint64_t last_block = 0;
    uint64_t b = heap_start_vaddr;
    while (b <= heap_end_vaddr)
    {
        uint32_t b_blocksize = get_blocksize(b);
        uint32_t b_allocated = get_allocated(b);

        if (b_allocated == 0 && b_blocksize >= request_blocksize)
        {
            // allocate this block
            if (b_blocksize > request_blocksize)
            {
                // split this block 'b'
                // b_blocksize
            }
            else
            {
                // no need to split this block
                // set_blocksize(b, request_blocksize);
                set_allocated(b, 1);
                set_blocksize(b, request_blocksize);

                // set the left splitted block
                // in the extreme situation, next block size == 8
                // which makes the whole block of next to be:
                // [0x00000008, 0x00000008]
                uint64_t next_header_vaddr = b + request_blocksize;
                set_allocated(next_header_vaddr, 0);
                set_blocksize(next_header_vaddr, b_blocksize - request_blocksize);

                return get_payloadaddr(b);
            }
        }
        else
        {
            if(is_lastblock(b))
            {
                last_block = b;
            }
            // go to next block
            b = get_nextheader(b);
        }
    }

    // TODO: when no enough free block for current heap
    // request a new free physical & virtual page from OS
    if(heap_end_vaddr + 4096 <= HEAP_MAX_SIZE)
    {
        // we can allocate one page for the request
        uint64_t old_heap_end = heap_end_vaddr;
        heap_end_vaddr += 4096;

        uint32_t last_allocated = get_allocated(last_block);
        uint32_t last_blocksize = get_blocksize(last_block);

        if(get_allocated(last_block) == 1)
        {
            // no merging needed
            // add footer for last block
            set_allocated(old_heap_end, 1);
            set_blocksize(old_heap_end, last_blocksize);

            set_allocated(old_heap_end + 4, 0);
            set_blocksize(old_heap_end + 4, 4096);
        }
        else
        {
            // merging with last_block is need
            set_blocksize(last_block, last_blocksize + 4096);
        }
    }
#ifdef DEBUG_MALLOC
    printf("OS cannot allocate physical page for heap!\n");
#endif

    // <==> return NULL;
    return 0;
}

void mem_free(uint64_t vaddr)
{
    assert(heap_start_vaddr <= vaddr && vaddr <= heap_end_vaddr);
    assert((vaddr & 0x6) == 0x0);

    uint64_t req = get_blockheader(vaddr);
    uint32_t req_blocksize = get_blocksize(req);
    uint32_t req_allocated = get_allocated(req);
    assert(req_allocated == 1);

    // block starting address of next & prev blocks
    // TODO: corner case - req can be the first or last block
    uint64_t next = get_nextheader(vaddr);
    uint64_t prev = get_prevheader(vaddr);

    uint32_t next_allocated = get_allocated(next);
    uint32_t prev_allocated = get_allocated(prev);

    uint32_t next_blocksize = get_blocksize(next);
    uint32_t prev_blocksize = get_blocksize(prev);

    if (next_allocated == 1 && prev_allocated == 1)
    {
        // case 1: *A(A->F)A*
        set_allocated(req, 0);
    }
    else if (next_allocated == 0 && prev_allocated == 1)
    {
        // case 2: *A(A->F)FA*
        set_allocated(req, 0);
        set_blocksize(req, req_blocksize + next_blocksize);
    }
    else if (next_allocated == 1 && prev_allocated == 0)
    {
        // case 3: *AF(A->F)A*
        set_allocated(prev, 0);
        set_blocksize(prev, req_blocksize + prev_blocksize);
    }
    else
    {
        // case 4: *AF(A->F)FA*
        set_allocated(prev, 0);
        set_blocksize(prev, prev_blocksize + req_blocksize + next_blocksize);
    }
}

/***************** test code start *********************/
void test_round_up()
{
    printf("Testing round_up ...\n");
    for (int i = 0; i < 100; i++)
    {
        for (int j = 0; j <= 8; j++)
        {
            uint32_t x = i * 8 + j;
            assert(round_up(x, 8) == (i + 1) * 8);
        }
    }
    printf("\033[32;1m\tPass\033[0m\n");
}

/*
hex table
0               0000
1
2
3
4
5
6
7
8
9
a
b
c
d
e
f
*/
void test_getblocksize_allocated()
{
    printf("Testing get block size from header");

    for (int i = 4; i < 4096 - 1; i += 4)
    {
        *(uint32_t *)&heap[i] = 0x1234abc0;
        assert(get_blocksize(i) == 0x1234abc0);
        assert(get_allocated(i) == 0);

        *(uint32_t *)&heap[i] = 0x1234abc1;
        assert(get_blocksize(i) == 0x1234abc0);
        assert(get_allocated(i) == 1);

        *(uint32_t *)&heap[i] = 0x1234abc8;
        assert(get_blocksize(i) == 0x1234abc8);
        assert(get_allocated(i) == 0);

        *(uint32_t *)&heap[i] = 0x1234abc9;
        assert(get_blocksize(i) == 0x1234abc8);
        assert(get_allocated(i) == 1);
    }

    printf("\033[32;1m\tPass\033[0m\n");
}

void test_set_blocksize_allocated()
{
    printf("Testing get block size from header");

    for (int i = 4; i < 4096 - 1; i += 4)
    {
        set_blocksize(i, 0x1234abc0);
        set_allocated(i, 0);
        assert(get_blocksize(i) == 0x1234abc0);
        assert(get_allocated(i) == 0);

        set_blocksize(i, 0x1234abc0);
        set_allocated(i, 1);
        assert(get_blocksize(i) == 0x1234abc0);
        assert(get_allocated(i) == 1);

        set_blocksize(i, 0x1234abc8);
        set_allocated(i, 0);
        assert(get_blocksize(i) == 0x1234abc8);
        assert(get_allocated(i) == 0);

        set_blocksize(i, 0x1234abc8);
        set_allocated(i, 1);
        assert(get_blocksize(i) == 0x1234abc8);
        assert(get_allocated(i) == 1);
    }

    // set the block size of last block
    for (int i = 2; i < 100; i++)
    {
        uint32_t blocksize = i * 8;
        uint64_t addr = 4096 + 4 - blocksize;
        set_blocksize(addr, blocksize);
        assert(get_blocksize(addr) == blocksize);
        assert(is_lastblock(addr) == 1);
    }
    
    printf("\033[32;1m\tPass\033[0m\n");
}

void test_get_header_payload_addr()
{
    printf("Testing getting header or payload virtual address ...\n");

    uint64_t header_addr, payload_addr;
    for (int i = 8; i < 4096-1; i+=8)
    {
        payload_addr = i;
        header_addr = payload_addr - 4;

        assert(get_payloadaddr(header_addr) == payload_addr);
        assert(get_payloadaddr(payload_addr) == payload_addr);

        assert(get_blockheader(header_addr) == header_addr);
        assert(get_blockheader(payload_addr) == header_addr);
    }
    
    printf("\033[32;1m\tPass\033[0m\n");
}

void test_get_next_prev()
{
    printf("Testing linked list traversal ...\n");

    srand(123456);

    // let me setup the heap first
    uint64_t h = heap_start_vaddr;
    uint64_t f =0;

    uint32_t prev_allocated = 1;        // dummy allocated

    uint32_t collection_blocksize[1000];
    uint32_t collection_allocated[1000];
    uint32_t collection_headerraddr[1000];
    int counter = 0;

    while(h <= heap_end_vaddr)
    {
        uint32_t block_size = 8 * (1 + rand() % 16);
        if(heap_end_vaddr - h <= 64)
        {
            block_size = 4096 + 4 - h;
        }

        uint32_t allocated = 1;
        if(prev_allocated == 1 && (rand() & 0x1) == 1)
        {
            allocated = 0;
        }

        collection_blocksize[counter] = block_size;
        collection_allocated[counter] = allocated;
        collection_headerraddr[counter] = h;

        set_blocksize(h, block_size);
        set_allocated(h, allocated);

        if(is_lastblock(h) == 0)
        {
            f = h + block_size - 4;
            set_blocksize(f, block_size);
            set_allocated(f, allocated);
        }

        h = h + block_size;
        prev_allocated = allocated;
        counter += 1;
    }

    // check get_next
    h = heap_start_vaddr;
    int i = 0;
    while(is_lastblock(h) == 0)
    {
        assert(i < counter);
        assert(h == collection_headerraddr[i]);
        assert(get_blocksize(h) == collection_blocksize[i]);
        assert(get_allocated(h) == collection_allocated[i]);
        assert(check_block(h) == 1);

        h = get_nextheader(h);
        i += 1;
    }

    // check the last block
    assert(is_lastblock(h));

    //check get_prev
    i = counter - 1;
    while(heap_end_vaddr <= h)
    {
        assert(0 < i);
        assert(h == collection_headerraddr[i]);
        assert(get_blocksize(h) == collection_blocksize[i]);
        assert(get_allocated(h) == collection_allocated[i]);
        assert(check_block(h) == 1);

        h = get_prevheader(h);
        i -= 1;
    }

    printf("\033[32;1m\tPass\033[0m\n");
}

/***************** test code end *********************/

#ifdef DEBUG_MALLOC
int main()
{
    heap_init();

    printf("malloc!\n");
    return 0;
}
#endif