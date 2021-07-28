import torch

def main():
    assert torch.cuda.is_available()
    print("Hello, World! You have a GPU available!")

if __name__ == "__main__":
    main()
