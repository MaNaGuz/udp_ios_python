import os
import socket

HOST = "0.0.0.0"

def main():
    port = int(os.getenv("PORT", "5001"))

    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind((HOST, port))

    print(f"Listening on {HOST}:{port}", flush=True)

    while True:
        data, addr = sock.recvfrom(1024)
        print(f"Received from {addr}: {data.decode(errors='replace')}", flush=True)

if __name__ == "__main__":
    main()