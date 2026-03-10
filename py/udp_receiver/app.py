import socket
import os

HOST = "0.0.0.0"
PORT = 5005

def main():
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind((HOST, PORT))

    print(f"Listening on {HOST}:{PORT}")

    while True:
        data, addr = sock.recvfrom(1024)
        print(f"Received from {addr}: {data.decode()}")

if __name__ == "__main__":
    PORT = int(os.getenv("PORT"))
    main()