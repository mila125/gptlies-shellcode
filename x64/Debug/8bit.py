#!/bin/python3
import sys

chunk_size = 8

def slice_text_into_pieces(text, chunk_size):
    chunks = [text[i:i+chunk_size] for i in range(0, len(text), chunk_size)]
    return chunks

if len(sys.argv) != 2:
    print("Usage: python3 stringParser.py <string>")
else:
    try:
        input_text = str(sys.argv[1])
        sliced_chunks = slice_text_into_pieces(input_text, chunk_size)
        print("[+] Sliced into 8 bytes")
        print(sliced_chunks)
        for x in sliced_chunks:
            print(x +" <==> 0x"+ bytearray.fromhex(x.encode("utf-8").hex())[::-1].hex())
        
    except:
        print("Error occured.")